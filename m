Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734BB70
	for <regressions@lists.linux.dev>; Fri,  2 Jul 2021 15:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1625239978;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3Cd+K4jIqQLeewL7m9XyUwSEW40GwxA4YOI3ZvD6OqQ=;
	b=BOlqIIazyiI/9NYpLuZYjWuvl/oIGdgvI0wfRK05tpCK1qIW/ubdarocQ0yiQ7BDp7L9yS
	Ngp7Ioo1K3EMP0fSIoiXjYUY5fkJzjJaXloEjF6z83Rv6vPnwKnpUTB9gX6oTTP7/g/wOF
	1YdVIcRidyGkz2FKkoOzwhkbn3K3EAQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-73XFQjEPNyWupYHs6n6ceA-1; Fri, 02 Jul 2021 11:32:57 -0400
X-MC-Unique: 73XFQjEPNyWupYHs6n6ceA-1
Received: by mail-wr1-f69.google.com with SMTP id a4-20020a0560001884b0290124b6e4a437so4033700wri.16
        for <regressions@lists.linux.dev>; Fri, 02 Jul 2021 08:32:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=3Cd+K4jIqQLeewL7m9XyUwSEW40GwxA4YOI3ZvD6OqQ=;
        b=NLEnuKciCbj08ZRauLV+lw0s73vH8Rl1Jp4wD5M64mhEyvtjnMni4CeGR78M0sdr/Y
         2wnbtiPrYCgrd6NVzpN6wSzyc96gTWpPZjQufNV7zZhXbV5TE8vCKcbw4Uhp/gUG3pFF
         BUi9WPXm7X1D0YaQxfP5gRwzhYcpW2zBpnorPbbw6tVQ7ha+LWD00nRcO4EAFW+aHaQV
         vHUyJy6tvZ2U9RHXZ9nVSvWPC+ZH7ddu3fqsbva5DnUyEHC21Pe9//YxHsuIw7exud9B
         2jmx8yquCwF/nfMeWHtbgqvyBVWLSsNcd7fN74oJ8jC50q2WKCrQ2EY5H8o7440A94Mk
         Iucw==
X-Gm-Message-State: AOAM531xMGzUc+Co59lq2v5tAaiejUW8OYbeOAe1vKvmcYxqDaiiKSRX
	/8b8qQI4DVr6XTgEEh9yAOIm1fmz9Sz2ukTfu85bSWg3J2hX/+Af8U1DgyEsm19+q0mziaWwSvV
	0YQIBGt4ITzM1iQ0cDmlhKA8=
X-Received: by 2002:a05:600c:3205:: with SMTP id r5mr352421wmp.75.1625239975974;
        Fri, 02 Jul 2021 08:32:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJymNaIXvDhXP8nBj8nAhM/wQh3OeUp5eyCO6kAY9mIv6PdHKQiIvu3qVL5MMB+Ap3A8y8DfYQ==
X-Received: by 2002:a05:600c:3205:: with SMTP id r5mr352394wmp.75.1625239975763;
        Fri, 02 Jul 2021 08:32:55 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-112-171.dyn.eolo.it. [146.241.112.171])
        by smtp.gmail.com with ESMTPSA id z5sm3567734wrt.11.2021.07.02.08.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jul 2021 08:32:55 -0700 (PDT)
Message-ID: <54cd08089682aa14cc43236b0799ebf8424a23c5.camel@redhat.com>
Subject: Re: [regression] UDP recv data corruption
From: Paolo Abeni <pabeni@redhat.com>
To: Matthias Treydte <mt@waldheinz.de>
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>, David Ahern
	 <dsahern@gmail.com>, stable@vger.kernel.org, netdev@vger.kernel.org, 
	regressions@lists.linux.dev, davem@davemloft.net, yoshfuji@linux-ipv6.org, 
	dsahern@kernel.org
Date: Fri, 02 Jul 2021 17:32:54 +0200
In-Reply-To: <20210702172345.Horde.VhYvsDcOcRfOxOFrUo9F1Ge@mail.your-server.de>
References: <20210701124732.Horde.HT4urccbfqv0Nr1Aayuy0BM@mail.your-server.de>
	 <38ddc0e8-ba27-279b-8b76-4062db6719c6@gmail.com>
	 <CA+FuTSc3POcZo0En3JBqRwq2+eF645_Cs4U-4nBmTs9FvjoVkg@mail.gmail.com>
	 <20210702143642.Horde.PFbG3LFNTZ3wp0TYiBRGsCM@mail.your-server.de>
	 <6c6eee2832c658d689895aa9585fd30f54ab3ed9.camel@redhat.com>
	 <d8061b19ec2a8123d7cf69dad03f1250a5b03220.camel@redhat.com>
	 <20210702172345.Horde.VhYvsDcOcRfOxOFrUo9F1Ge@mail.your-server.de>
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pabeni@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2021-07-02 at 17:23 +0200, Matthias Treydte wrote:
> Quoting Paolo Abeni <pabeni@redhat.com>:
> 
> > ---
> > diff --git a/net/ipv4/udp_offload.c b/net/ipv4/udp_offload.c
> > index 54e06b88af69..458c888337a5 100644
> > --- a/net/ipv4/udp_offload.c
> > +++ b/net/ipv4/udp_offload.c
> > @@ -526,6 +526,8 @@ struct sk_buff *udp_gro_receive(struct list_head  
> > *head, struct sk_buff *skb,
> >                 if ((!sk && (skb->dev->features & NETIF_F_GRO_UDP_FWD)) ||
> >                     (sk && udp_sk(sk)->gro_enabled) ||  
> > NAPI_GRO_CB(skb)->is_flist)
> >                         pp =  
> > call_gro_receive(udp_gro_receive_segment, head, skb);
> > +               else
> > +                       goto out;
> >                 return pp;
> >         }
> 
> Impressive! This patch, applied to 5.13, fixes the problem. What I  
> like even more is that it again confirms my suspicion that an "if"  
> without an "else" is always a code smell. :-)

Thank you for the quick feedback! I'll submit formally soon, after more
tests. I'll probably change the code to be something hopefully more
readable, as follow:

---
diff --git a/net/ipv4/udp_offload.c b/net/ipv4/udp_offload.c
index 7a670757f37a..b3aabc886763 100644
--- a/net/ipv4/udp_offload.c
+++ b/net/ipv4/udp_offload.c
@@ -551,8 +551,10 @@ struct sk_buff *udp_gro_receive(struct list_head *head, struct sk_buff *skb,
 
                if ((!sk && (skb->dev->features & NETIF_F_GRO_UDP_FWD)) ||
                    (sk && udp_sk(sk)->gro_enabled) || NAPI_GRO_CB(skb)->is_flist)
-                       pp = call_gro_receive(udp_gro_receive_segment, head, skb);
-               return pp;
+                       return call_gro_receive(udp_gro_receive_segment, head, skb);
+
+               /* no GRO, be sure flush the current packet */
+               goto out;
        }
---

> With this and the reproducer in my previous mail, is there still value  
> in doing the "perf" stuff?

Not needed, thank you!

Would be great instead if you could have a spin to the proposed variant
above - not stritly needed, I'm really asking for a few extra miles
here ;)

Cheers,

Paolo

