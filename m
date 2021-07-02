Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79CDA168
	for <regressions@lists.linux.dev>; Fri,  2 Jul 2021 14:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1625234790;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m6Mna86YdcQ7UWi1VsRKdRyxdiO+RtsBgfouscqciX0=;
	b=UdWr1kif+OnYTNSsmEn1jqAOA5fO3XlaxryKU3BWA/g+OPx8RvuURbaW2ZSjcmbmIf1ZlO
	UHaKT1/RUVnX0Q5LASkftCkwUYBdzwgWJTuaWDB0qKwNNTUB2sxk7xcaEf85lP6WfMol27
	rqpUaTCqdBFCLs8HdoMEr+zSU9QLm6w=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-581-CB6eN6LrPzeJAxIWFVZE_A-1; Fri, 02 Jul 2021 10:06:27 -0400
X-MC-Unique: CB6eN6LrPzeJAxIWFVZE_A-1
Received: by mail-wr1-f69.google.com with SMTP id u7-20020a5d46870000b029012786ba1bc9so3938060wrq.21
        for <regressions@lists.linux.dev>; Fri, 02 Jul 2021 07:06:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=m6Mna86YdcQ7UWi1VsRKdRyxdiO+RtsBgfouscqciX0=;
        b=uSjb1s08MpvjSWXTNYKs4TTJcCu5saqZum4kLNXg/vrSggQclYFs3CFJmYkncXgfbG
         TCeP/amhO2U5wd1cV6bBpd7YaGWJSbMgbnE3huGmEctXiTrmY/s7KDJNDBGSkE6cjjNg
         GWnMqLR5w5mYgfPoKun3KtqmI4eShkuSVJz0cSXFl6y/5FItxjOPzYOi/e5Q/2mhBZkM
         RMLh41zZZ/WWAjYiGa8HLvuTVjTbr5mpNQA1YAisJNzyyc6W5JVMW5MDqjmba9uY6R7h
         Pznw6ozmZLW2kiQCMCG7U+gIBp0t1aJDsuWNXniWVi9AAByXV2o3S7ut7qkwqFAYmL0O
         Ty/w==
X-Gm-Message-State: AOAM531ZJ2F5GMbvQbpsrwiBHN+GKeZf5y/ZxQ0AD6/WoarcbCYRzq0+
	rbFmvwiZi1JtIZdvJTPCfZluqJnY1yPlDPxgAe87puZMdUpIyNv5ktim+nxTyOdwnXo5VytyJQR
	GC6uV0hCpLNr9qc02pRxlK0E=
X-Received: by 2002:a5d:4a8d:: with SMTP id o13mr6117833wrq.241.1625234786021;
        Fri, 02 Jul 2021 07:06:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwA9TE3RJu3zzU4nu2KP8KMTfpIvvr1FHhaBi2SGdvArpcNv2wIeUwcMCsHztpsb/Ars/QDNw==
X-Received: by 2002:a5d:4a8d:: with SMTP id o13mr6117786wrq.241.1625234785778;
        Fri, 02 Jul 2021 07:06:25 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-112-171.dyn.eolo.it. [146.241.112.171])
        by smtp.gmail.com with ESMTPSA id p7sm3337907wrr.68.2021.07.02.07.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jul 2021 07:06:25 -0700 (PDT)
Message-ID: <6c6eee2832c658d689895aa9585fd30f54ab3ed9.camel@redhat.com>
Subject: Re: [regression] UDP recv data corruption
From: Paolo Abeni <pabeni@redhat.com>
To: Matthias Treydte <mt@waldheinz.de>, Willem de Bruijn
	 <willemdebruijn.kernel@gmail.com>
Cc: David Ahern <dsahern@gmail.com>, stable@vger.kernel.org, 
	netdev@vger.kernel.org, regressions@lists.linux.dev, davem@davemloft.net, 
	yoshfuji@linux-ipv6.org, dsahern@kernel.org
Date: Fri, 02 Jul 2021 16:06:24 +0200
In-Reply-To: <20210702143642.Horde.PFbG3LFNTZ3wp0TYiBRGsCM@mail.your-server.de>
References: <20210701124732.Horde.HT4urccbfqv0Nr1Aayuy0BM@mail.your-server.de>
	 <38ddc0e8-ba27-279b-8b76-4062db6719c6@gmail.com>
	 <CA+FuTSc3POcZo0En3JBqRwq2+eF645_Cs4U-4nBmTs9FvjoVkg@mail.gmail.com>
	 <20210702143642.Horde.PFbG3LFNTZ3wp0TYiBRGsCM@mail.your-server.de>
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

Hello,

On Fri, 2021-07-02 at 14:36 +0200, Matthias Treydte wrote:
> And to answer Paolo's questions from his mail to the list (@Paolo: I'm  
> not subscribed, please also send to me directly so I don't miss your mail)

(yup, that is what I did ?!?)

> > Could you please:
> > - tell how frequent is the pkt corruption, even a rough estimate of the
> > frequency.
> 
> # journalctl --since "5min ago" | grep "Packet corrupt" | wc -l
> 167
> 
> So there are 167 detected failures in 5 minutes, while the system is receiving
> at a moderate rate of about 900 pkts/s (according to Prometheus' node exporter
> at least, but seems about right)

Intersting. The relevant UDP GRO features are already off, and this
happens infrequently. Something is happening on a per packet basis, I
can't guess what.

It looks like you should be able to collect more info WRT the packet
corruption enabling debug logging at ffmpeg level, but I guess that
will flood the logfile.

If you have the kernel debuginfo and the 'perf' tool available, could
you please try:

perf probe -a 'udp_gro_receive sk sk->__sk_common.skc_dport'
perf probe -a 'udp_gro_receive_segment'

# neet to wait until at least a pkt corruption happens, 10 second
# should be more then enough
perf record -a -e probe:udp_gro_receive -e probe:udp_gro_receive_segment sleep 10

perf script | gzip > perf_script.gz

and share the above? I fear it could be too big for the ML, feel free
to send it directly to me.

> Next I'll try to capture some broken packets and reply in a separate mail,
> I'll have to figure out a good way to do this first.

Looks like there is corrupted packet every ~2K UDP ones. If you capture
a few thousends consecutive ones, than wireshark should probably help
finding the suspicious ones.

Thanks!

Paolo

