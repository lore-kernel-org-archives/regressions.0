Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793272849;
	b=osI3N7XfDJSoBLO2x+y1Eg7RGzkhe0xl7lXAVj/i7r9aAw6ZiTKfCjniZDQ70Rrf58hC
	 rExyAkRTEWb0aZji04R13hansigwoHzzPlnGddXgtloj5cg1jG3BoI7nFVHJ37bK1IM2S
	 FDnEs+KzDgfeqCY9VyHHY/Uyp0sazd8/7mro1Cn0i97kRySx2gyNZp3DmJwPq4rTIbot0
	 dg4jYgcvYNaDsIeSAS909tUF1ddI4RJKzs2t8CH5ku7eq/oNYqVD3BPo+UJ6Vak6Ozxd2
	 SOMfr2S4snI9/N0vS+lQt/YssID0WRwIhanbpns+q6jKbMpuuEQTU3PDnphJ8NrWtAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793272849;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=j8Zt37GO6hvBK/VWxNoOISHBNExAaLWjWwQPv4izgSk=;
	b=fE0JsBDf5x3OxbrDECEexFWTwoLlFha8JV1KJqm6fSYcvESgGbL9azJ4wjlpLMN9x+C0
	 nEfJUoWUfWhD8pSftGFDQc8ulhwqlIBDarLGYYQ8jTp9LK46x5MBAEQ8lfLFs4pyYzd3b
	 dWz5qSkXimJ6sFg4jxeNo+Bb0iUVt10NR/qM6wE18v2dTl3/QKvGp+LFHhuiF6HGAacBA
	 tbFlNVwR50MSuEK0lz2AYf3cTeoW9R9IHeFCQBs2TwXertU5VxaFvBdXv51EsF6cFUGc+
	 mJboelEIWiBZyjSdKnt0dPXHMJgST3xs+/1Ap19+2f9jRujk6hBcIgE+YowGWgu3CUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ftEYU3yp;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28465606A31E
	for <regressions@lists.linux.dev>; Thu, 29 Oct 2026 11:20:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28465606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ftEYU3yp
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48e4831c028so1655702f8f.0
        for <regressions@lists.linux.dev>; Thu, 29 Oct 2026 04:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793272847; x=1793877647; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j8Zt37GO6hvBK/VWxNoOISHBNExAaLWjWwQPv4izgSk=;
        b=ftEYU3ypY4g7812ao70t6aJ2PHQ81zsRENNZ+UKjvH+lXGqD25yAogBmfY4MbMLWVL
         KsCYdgyoPdqrdHQBXz3+ah28vR6ADq+1I9mFYqdoukNBQAQCDMKfmFAoFxkIFyKu+FJ5
         Dm3YA10JkzqTLrst6wtFj5khgoYT8XV/7E2XzPy5RjC40a9ldb8qJ+CFW3SEpLvQ8//Q
         pA22nTubaBaEyRmolkEoiJyzUTEl68pfCArm0xpomsPyVDSr95dNzC02QJx2GXbPXZZQ
         3kt1XEX9WEmbCfLXaXM9HECIcw1CQ4x1R9F6aNdaVIyatowBSXsXYiWsrnAImeW+rIuG
         y2xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793272847; x=1793877647;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j8Zt37GO6hvBK/VWxNoOISHBNExAaLWjWwQPv4izgSk=;
        b=Myphk002j8GGzqc6w2w4+9jCb7TZgwIlQFOmDIwtBliig/GFWMDxrx+LlTMY/w84AD
         HYPhVbaID8bu4xoq2m4fFbBUdYpQMDZnbi/rpHd2D6s2rEA/Nxp1/AaYWEsyVbq6ljIO
         VpzopLCdUsNiRMj2KOaDfFT3gsrL8wU4iFakRR2KY+NVsyV+Z6tgdvacCLOH0RyHLMQA
         wZqokb5oywUTZspQywZBhoHStajTNk/ef/+0BRF5UVmMTVRVt1rY1Ofzwb869iR8B0Dh
         Gto1s039mGaFAwQijIPfULXCxKV7sVdXG3uUr0+TuGTbIayNZ3ESs/Rst9L+72KJXhnU
         PvpQ==
X-Forwarded-Encrypted: i=1; AKwUvBzMLRP0Vv9z9oYiAM7JeJpPAbvFvPPMkEhbkekFUT0tY+ygcoPIdrzkfQcD6ND7WgaGtyVQjcLhMaI2dg==@lists.linux.dev
X-Gm-Message-State: AFq9FYILnYuFjc59VSvhhYQ9U6MnyfsiYuLhCjYlG0OXj3wpAk00jqgx
	DT3svS4b9E0FUDEtZZq2y1Gx26ifr93blE5RUVsbOOPUcpPwPgdo4PIX
X-Gm-Gg: AYBFou35ssHJA4olYb1oBtxvktM/lOHbZTuzI2qF+E1smR1aswrcBqAxRXpQ5SDabK4
	OYk4Jo8q2mwRmNGUrVGzzc0fognn9n58swWMj8iqVjpVV91pe9TojZQKiVRRRoTBprtNhhq+v9z
	RwwLeeuqqajri61SGOT2G7G/ahrK1PRYgp4RxNmqspA0TKPbSsz0pH1Sh1ypGnzokoNox2F90WU
	Z2a9E04u7Hw2vjT4DPwJJmb5WhtE1nx6+xjN14Yg+z6zEgz9Cc51xGU6k25Je7paDerkY4z0J4K
	NTbBtL04nmY9G37AsOCzRifZnry8pNW2qDmcXjSa9gdzCh/3xAmQBadsTuU/FPP+B/RbVUqP5Z9
	EjkmlPC+Av3Ibd/8sR2/Qk5tSE746mzuhLb3R0use8tRR9LDI7LNiWvRShyqKw/o2TK7HHQE4xI
	m4wucc+wqRAoj8XnhwfLLVtTItqOVpShw/yGs2YqPASzIGlmyStmI5vUdK+IM6Ri85YBg9IL7Wp
	VmN9bRkGzQAc26VKyTeClnI4qT2xmborrKXIQ7KYEvXC9gAVEYCl+fUS1pYUkf/gm+ILNHf/YBg
	EfEoXtCBQTFn5pdOBGMMbSWxh5AD+Y+FdK+XzcZUEUcc9BxYKGxa65nGsmafLrD+ddc=
X-Received: by 2002:a05:600c:8184:b0:4a1:d087:f6ab with SMTP id 5b1f17b1804b1-4a967016ae6mr109930585e9.18.1793272847111;
        Thu, 29 Oct 2026 04:20:47 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e6419e05dsm5345525f8f.19.2026.10.29.04.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 04:20:46 -0700 (PDT)
Date: Thu, 29 Oct 2026 11:20:45 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Esko Mobius <echoowall@gmail.com>
Cc: netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>, Simon Horman
 <horms@kernel.org>, David Ahern <dsahern@kernel.org>, Ido Schimmel
 <idosch@nvidia.com>, Jiayuan Chen <jiayuan.chen@linux.dev>, Shuah Khan
 <shuah@kernel.org>, Thorsten Leemhuis <regressions@leemhuis.info>,
 regressions@lists.linux.dev, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, Eric Dumazet
 <edumazet@kernel.org>
Subject: Re: [PATCH net 2/2] Revert "net: advertise TCP MSS from the
 configured MTU, not the learned PMTU"
Message-ID: <20261029112045.5e7d4317@pumpkin>
In-Reply-To: <22077B76-12B0-4DD6-813E-A3968003575F@gmail.com>
References: <20261026-advmss-revert-v1-0-272fa4b7ecb6@gmail.com>
	<20261026-advmss-revert-v1-2-272fa4b7ecb6@gmail.com>
	<20261029101859.6893f1a0@pumpkin>
	<22077B76-12B0-4DD6-813E-A3968003575F@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 29 Oct 2026 18:21:22 +0800
Esko Mobius <echoowall@gmail.com> wrote:

> On Thu, 29 Oct 2026, David Laight wrote:
> > If it isn't a silly question, how to connections in the other direction
> > work?
> >
> > I'd have thought they'd need that ICMP message to get through.  
> 
> Not silly at all. The frag-needed always goes back to whoever sent the
> oversized packet, and only the client side filters inbound ICMP.
> 
> Server -> client (downloads): the server's full-size segment hits the
> 1456 hop, the router there sends frag-needed back to the server, which
> accepts it, learns the PMTU and resends smaller segments. The server's
> send side was never changed by 2640e6419594 (tcp_current_mss() still
> uses the learned PMTU), so downloads always worked.
> 
> Client -> server (uploads): the client's full-size segment hits the same
> hop, the frag-needed goes back towards the client (via the relay's
> conntrack), and the client-side firewall drops it. The client never
> learns to send smaller segments, so the upload stalls. Here the only
> thing that kept segments small was the smaller MSS the server
> advertised in its SYN-ACK, which is what the reverted commit removed.

But that relies on something having gone the other way first.
In general that won't be true.

It is almost worth implement something that retries with the shorter mtu
to detect the PPPoE mtu blackhole at the sending end.
Or even just use the shorter mtu for long RTT connections.
It won't make much difference to throughput (maybe about 0.3%).

David

> 
> Thanks,
> Yongjian
> 

