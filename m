Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793269302;
	b=VWZYuV56WMPwT/dyZ/Uo9KTU3FpEEvnL3z2cAVHCfBirJ/g4f1jhkRYEKQsWGnNVDBfl
	 uL+vUPFMVg8u0I+lE7GuPCKZNR4+vnCC0IDlx8epNmpNWWBxOKS1um0LR2iTFCdi1+ABG
	 fBBN4eI//cO6drWOdwEHhkpmv5i62mL5KcPoOucXTLMjwXDfCk30ICWaPXSLgswJYEEmA
	 /bVh0OaYaz4StexWJJ57a8u91ecTiQl4HLmlOymfunCsTuELgs8ecvpt3AIZgR1eocfuJ
	 du+pCiijed09W7hKOrgrX5S+PQ9znyqMLjL+LuMNBj5jtS2aZiOqOXsvqZLGq+ywmLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793269302;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer;
	bh=p4CsFDjPOd5dzP69uoDvcx2oKYWrFhACnk9N0TgFakE=;
	b=VNK5WVD58DoAqW/IFfF2iWfJTK2amJ3wESsgp+blnQXrwk//ev8f9RAKyFv7wsoheQk4
	 UuGj7f7F72Z33sPR6qHzrdPBY17eAg9+5Gn0jQu0ivd7qZaJSa+kpklVAx0l6hjpeN9YO
	 RoILIPFBbPBD0/1wDsTwLbqZdtoQgpX1+IsvcNaAL7/3Tjc+0s2FGqFOhdKMD2b/qpJRn
	 23nS36ucnm1SaMKw43KKUCvKhTNXgHekQffr9dtcKmxI07YWYnUl6LB0aRKd7axJpkmU9
	 WgMhLBRFyQ/M0UP64E+WmEQPoxKFuMuOL7ckf3ncB0/yRDHZWvQACP4rNZmLQOaVKsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WpV45Tzh;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072A5606A31C
	for <regressions@lists.linux.dev>; Thu, 29 Oct 2026 10:21:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 072A5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WpV45Tzh
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1a2761c69fbso4675343c88.0
        for <regressions@lists.linux.dev>; Thu, 29 Oct 2026 03:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793269301; x=1793874101; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=p4CsFDjPOd5dzP69uoDvcx2oKYWrFhACnk9N0TgFakE=;
        b=WpV45TzhHK9hLDqoH5UfDBYLDN/Cc5rSw7T2CdObhCk0hS1BftrcpAELBSNx4uKJ2Y
         BaW5Uni9u4ZO7V4ySfahe2r9iO9dwgcfrAtx20nvJ4SNvzwtPtCw3KKn8hTqiiykHFgS
         lvlEVZxp+UO7ozyyY7qfZORX3/anO/Tv4cCOuJOiKI1YzLcbJd/7DU9RJECTCzybu3w1
         qG2jA8aK+5PqUF19B/DOPlh4YMIxAa97M2xlOUEGDf0Kz5DFl330y+EccbnWl4+XzmYN
         9bbO/3os+aHGNOYJ/b1lQoLbdvxnx/iyTyeg/VSs1T0VBIQmJtDzerpf1yqKAI3GEMau
         MpqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793269301; x=1793874101;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p4CsFDjPOd5dzP69uoDvcx2oKYWrFhACnk9N0TgFakE=;
        b=TY1hu+i+VAyi7k8BuGWxboGKKleQYeTraXg9XVPboFmNGFvarH+OqXeuk5kkqkaimn
         pV1fVeiJ2GdqnNLI1XpPzJ0Luh1NJkl2moEgY1gUEF3/FvjiyLV9Agh9kbejKUf0I8Oj
         ihUTyxJ8MpWT2zzAQFTJXyso0w9WuT+PlrdIURfWJlCxQzFKGoXT9mjn4aNkhcCz0d4M
         rhCpO3WZDX0lJ+B773b7ViavA+r+aBxDcfWX2ySyP+iax63wM3w3rQDSogBzzklUXSSW
         3SGLPR60JUG7rJz45UmfHTvrxcq7PpBRsGU6SGKleDj/O6J820CZiurZj6F9ebCOooct
         YLJA==
X-Forwarded-Encrypted: i=1; AKwUvBwnOvt/o8wo9hoOI52VMGofgmKDNVkJmvjAZH2Axp9C2XzHh24BEbPYfrOIFU2j6blOxusTf6riLwsWxA==@lists.linux.dev
X-Gm-Message-State: AFq9FYJ050wH9/USrcIC0afFv7AI2jS1M9hovSWjWXMYWuSAlsc1MKUf
	QcPrOti1MZgwvlslVjONeTY46GpotfeXuELj3oMJLnObR7hf4Sew4VGc
X-Gm-Gg: AYBFou1uKSI69jcEbedlkgL8SarQ3unZIp6DSxUt//M3JUKmlKQkZBZ9gM7Li3mp5RJ
	ZEOk5TXNqYmLoQsEOX3tuJAxwJEhnTUIxWokkNvhYt+HJo/DvCg/MoqQ44ftNmdVpRlLltu858F
	kBs2QYttbZNpWUSarZNyPBVDK19N0WCpG3YyoY7kykgjQW3Hm+HEmhRkhZclB6GTudoSJrH07c8
	WE4IHiSXK8KAuTMz8HlNHVw5ZEOk+YLrGe3m3MatQWQCJ2oqsojvnzTkJEqL9zSxlCWDLzWaIMA
	rbyv5C7HCNck6Nw3h3G9i+baQ75eGLdBfkajgINISrTVH200TjF8512VzSGj6IJE7ulfuLD8E+6
	woso1tNZab1RgV02vxNwF849ok6l0pYqTkS++WvOfGXbfLSmr7tRjt0hf2XyJ3REfD/jIso1XoO
	Db+f/wCgavL0o96yvuK3zperh3c71zaQcZYNl5r0a1qinHTi3wvc3udnBaeLfLCCi2DJrQ9+gX2
	Fw3R7nBjzNxmz5KMm35fE743gITbjCFUEtS8dmN8lbFUYjcLuA7BWhOL3MLeZ9KpZqJZ5rTcrb/
	Jpz2Ds4i978w5ebukJtr6lcx4OkemSyBBNb1Rf2mVNrA8/CZDlB226nSzupnXqOCTOo=
X-Received: by 2002:a05:701b:4211:10b0:18c:ad6d:b790 with SMTP id a92af1059eb24-1a6cf914593mr7053743c88.45.1793269300875;
        Thu, 29 Oct 2026 03:21:40 -0700 (PDT)
Received: from smtpclient.apple (v133-18-180-162.vir.kagoya.net. [133.18.180.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75d76814bsm13556801c88.10.2026.10.29.03.21.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Oct 2026 03:21:40 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCH net 2/2] Revert "net: advertise TCP MSS from the
 configured MTU, not the learned PMTU"
From: Esko Mobius <echoowall@gmail.com>
In-Reply-To: <20261029101859.6893f1a0@pumpkin>
Date: Thu, 29 Oct 2026 18:21:22 +0800
Cc: netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>,
 Simon Horman <horms@kernel.org>,
 David Ahern <dsahern@kernel.org>,
 Ido Schimmel <idosch@nvidia.com>,
 Jiayuan Chen <jiayuan.chen@linux.dev>,
 Shuah Khan <shuah@kernel.org>,
 Thorsten Leemhuis <regressions@leemhuis.info>,
 regressions@lists.linux.dev,
 linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 stable@vger.kernel.org,
 Eric Dumazet <edumazet@kernel.org>
Content-Transfer-Encoding: 7bit
Message-Id: <22077B76-12B0-4DD6-813E-A3968003575F@gmail.com>
References: <20261026-advmss-revert-v1-0-272fa4b7ecb6@gmail.com>
 <20261026-advmss-revert-v1-2-272fa4b7ecb6@gmail.com>
 <20261029101859.6893f1a0@pumpkin>
To: David Laight <david.laight.linux@gmail.com>
X-Mailer: Apple Mail (2.3901.100.1.1.12)

On Thu, 29 Oct 2026, David Laight wrote:
> If it isn't a silly question, how to connections in the other direction
> work?
>
> I'd have thought they'd need that ICMP message to get through.

Not silly at all. The frag-needed always goes back to whoever sent the
oversized packet, and only the client side filters inbound ICMP.

Server -> client (downloads): the server's full-size segment hits the
1456 hop, the router there sends frag-needed back to the server, which
accepts it, learns the PMTU and resends smaller segments. The server's
send side was never changed by 2640e6419594 (tcp_current_mss() still
uses the learned PMTU), so downloads always worked.

Client -> server (uploads): the client's full-size segment hits the same
hop, the frag-needed goes back towards the client (via the relay's
conntrack), and the client-side firewall drops it. The client never
learns to send smaller segments, so the upload stalls. Here the only
thing that kept segments small was the smaller MSS the server
advertised in its SYN-ACK, which is what the reverted commit removed.

Thanks,
Yongjian

