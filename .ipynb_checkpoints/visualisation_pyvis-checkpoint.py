import os
import numpy as np
import networkx as nx
from pyvis.network import Network

class data_prep:
    @staticmethod
    def triples(entities, relations, data_path):
        with open(os.path.join(data_path, entities)) as fin:
            entity2id = dict()
            for line in fin:
                eid, entity = line.strip().split('\t')
                entity2id[entity] = int(eid)
    
        with open(os.path.join(data_path, relations)) as fin:
            relation2id = dict()
            for line in fin:
                rid, relation = line.strip().split('\t')
                relation2id[relation] = int(rid)
                
        return entity2id, relation2id

    
    @staticmethod
    def read_triple(file_path, entity2id, relation2id):
        triples = []
        with open(file_path) as fin:
            for line in fin:
                head, relation, tail = line.strip().split('\t')
                triples.append((entity2id[head], relation2id[relation], entity2id[tail]))
        return triples

    
    @staticmethod
    def viz_pyvis_network(embeddings, labels, title, triples):
        nx_graph = nx.Graph()
    
        # Add nodes
        for i, (x, y) in enumerate(embeddings):
            nx_graph.add_node(i, x=x, y=y, label=labels[i], title=labels[i])
    
        # Add edges based on triples
        for head, relation, tail in triples:
            nx_graph.add_edge(head, tail, title=f'Relation {relation}', value=1)
    
        net = Network('800px', '800px', notebook=True)
        net.from_nx(nx_graph)
        net.show_buttons(filter_=['physics'])
        net.show(f"{title}.html", notebook=False)

    
    @staticmethod
    def data_viz(triples, title):
        nx_graph = nx.Graph()
        for head, relation, tail in triples:
            nx_graph.add_edge(head, tail, title=f'Relation {relation}', value=1)
        
        net = Network('800px', '800px', notebook=True)
        net.from_nx(nx_graph)
        net.show_buttons(filter_=['physics'])
        net.show(f"{title}.html", notebook=False)
