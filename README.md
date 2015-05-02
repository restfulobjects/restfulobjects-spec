# Restful Objects #

The Restful Objects specification defines a set of RESTful resources, and corresponding JSON representations, for accessing and manipulating a domain object model.

The spec defines a uniform interface to the domain objects. This uniformity is expressed in terms of the format of URLs, use of standard HTTP methods, standard and custom HTTP headers, standard HTTP return codes, use of JSON representations, the concept of a representation type to allow the dynamic handling by clients, standard attributes within JSON representations, and standard representation of links between representations.

The Restful Objects spec is at a higher-level of abstraction than, say, the JAX-RS specifications for Java platform, or the WCF specifications on .NET. Specifically, the domain objects that it exposes as resources are thought of in similar terms to UML, in that they consist of properties (holding either a scalar value or reference), collections (holding a vector of references), and actions (whereby the object can execute business logic).

Restful Objects is agnostic as to the nature of the server-side state that it exposes, in that it may be used either to expose domain entities (Customer, Order, Product) or may be used to expose use cases/commands (CheckIntoFlight, CancelOrder).

Finally, the spec is designed to support clients that use HATEOAS (hypertext as the engine of application state, with opaque URI values) and also those that prefer to use templated URIs.

# Implementations #

There are currently two implementations of frameworks that implement the spec, allowing a RESTful API to be automatically generated from a domain object model.

[Apache Isis](https://isis.apache.org) is a full-stack open source application development framework, designed to let you rapidly develop domain-driven business enterprise applications, for the Java platform.

[Restful Objects for .NET](http://restfulobjects.codeplex.com) runs on the .NET platform, and was the first framework to fully implement this spec.

# Feedback #

Even though v1.0.0 of the Restful Objects spec has now been issued, we intend to continue working on the spec, clarifying it, enhancing it, and adopting new and emerging standards where appropriate. As such, we always welcome your feedback, either via the issue tracker on github, or just by commenting here.

