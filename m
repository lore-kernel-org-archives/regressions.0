Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793091054;
	b=gtNo+xy7E5Xed6uZm2f8M0I7781xXpmZUC13f6/6bG5u1fPro/CeFXb2b1BLAF81mgGJ
	 Hc8rbU/uzeH9l/W6SLbBP8thA2IV33uw7DNrZ0XZa90EVP2sKgPA44ptzf5kdSby3EMHG
	 P5bJrlR/YMaGBLZinyy2zl9tkqR1nQuod6MXcnXdt90rj0qTT/1BPRdlQ6CY0nn/SJLpg
	 BsjbcXnFLlFxeE59TZupyRxtgAO7NLVluvt3EGyJ9w+d1HEy8dEAR/ZAcZoiEghqpU9Vm
	 IKO+h9ZCkuAFMeNCZo7d840ivlXHwiliPmCn8DjcY8TAGALT8v4BYfc0Q6jQSdJfq7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793091054;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:From:In-Reply-To:X-Mimecast-Spam-Score:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:Content-Language:
	 Content-Type:Content-Transfer-Encoding;
	bh=05pWYvdSFKuQTlIpLib2CW0D3AAIr02xLV3H0zVKlko=;
	b=XHwxWoEPJl/TiUaIIzoPi0yZNEyBurWDwtcMv9UPy7gPKUL+uKW9agwpPpXUysNs9Hw9
	 VP2IcxmHw8tE5hPeaww0YJUy45c3o4G+TBzRM+lBPuhJVeCsBUpIx1ixx6Yj5KzpY6uJO
	 Uw8FSqyrSqGj8RG9xsY4ZeSj7+xEb2WXx2JVVC0xn/w7a70Te+PDVaARsm9Ts05TOz0TB
	 PfYNkGM3QaOrsMirhHF7z1/7sgt3xAuOhj+7Z5BrxgYkpuF6hIW5dIiOI/l+Tdc7vtMVH
	 azv5DddoA56ZhGad+IyoUaDSfD/U+xeRBaq1/NSZtzqMpS+RMrYL0FOF370z8hnz0TA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TCkFoK6B;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768F3606A31B
	for <regressions@lists.linux.dev>; Tue, 27 Oct 2026 08:50:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 768F3606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TCkFoK6B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793091052;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=05pWYvdSFKuQTlIpLib2CW0D3AAIr02xLV3H0zVKlko=;
	b=TCkFoK6BdyeWSDXRDds76wek9S8/AoUKw0AqZgkSUKz+KuZ145U9Hg1/xbosgXKWjp0MYV
	1FRSULf2Y/yleZlqG+7HoxFVLmWhIqqS+jYY5iu8s0LFc4rJf2YWinND7g7uNutvZnLJCg
	toIWx1EhYWbpwAmxFEIY1vQ5FfLjVY0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-583-nFA-GBoCPviUYEGwX7kH0Q-1; Tue, 27 Oct 2026 04:50:50 -0400
X-MC-Unique: nFA-GBoCPviUYEGwX7kH0Q-1
X-Mimecast-MFC-AGG-ID: nFA-GBoCPviUYEGwX7kH0Q_1793091049
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a210f93860so28111475e9.0
        for <regressions@lists.linux.dev>; Tue, 27 Oct 2026 01:50:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793091049; x=1793695849;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=05pWYvdSFKuQTlIpLib2CW0D3AAIr02xLV3H0zVKlko=;
        b=LHOZ7IrrPLiP8MicEZ6gUAXAqYnxx9VO9fPNBtY0WhgTAUCxqlKVd0zCCgx3GWDJAJ
         PRgOTBIvmLTt2MF+aESJ9To4/YI18dyhoHo7Ex7Yd4OQvfxAjVTgTYqKGS5zSDIxrNuQ
         2L1CSnEuo0qeV61/I190ISCBfeSgT9KCuDGybflO4z/uCOuw5diH8/uVaYyRda+OO3gr
         9Qv4OIh7aFD8d8eyJFYwRNS1WjY8zipOSfbGAu20QJ8wysaF6QmzA0GfI2A6Z7TvUxYR
         sXON/6KGDJcUWt9TcV9/iJNNwYVcjFmeZvG9k7Oscvwm6AaKeCbFYGSllbCgf6r284Kp
         QQtQ==
X-Forwarded-Encrypted: i=1; AKwUvBw+qQMia9Z4sBrbaxA1aYiiD/63tZBV8oiKj/PlyHKwwwzn1XJFXXudJ9hZbxvaaelVuzIDgMoVaB1NZQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYL06trKmlokJc0n4PFivYxFL4EDCvejHk0fS1fHjFSgMW20kLbY
	WS8NvRELGIe/IYRaiv4DmyNvRWT1SSWCMuIbxOTrhmxJSCkta4nuozQZGVRfcPQB4VtrAueCJ5l
	ioFngPI4k0DW/red8dsKdWPB7TqPcV5x1gvqzhD29DNM8tYsUpIUK3xZa3uN9lgWu
X-Gm-Gg: AYBFou1hQR4ltIH7QjhH1TeXba65k9Nfad4o6H1HrHci8WY9aasDz8DTZMLa8eqPopK
	dh6xIVrJ1/qzthSlUiFviG0JxKn/OPFbBGi6cIaD79UdqPESaPTnXwY/SmhkpRkR05p6/0++vyx
	QqcH4UK/4RQhPSuVqWTPra6JB3kQhn9xTeN+KVybHjkA+cvxo4KIhb1ssXTUxgoy/fJNV0LTh8q
	o2vbWuQmDZQjaZHS4hFgVBl3pg/gfHuErs1QMdu5s+KNt+9FMrTi+kzb63lIxrxY0LfqvLWthWM
	+7W+V+w5apqmHjIZFv1gppBXW/X5Sty9u7fQudPfnEteWpEjay1PsO4kAepXKncC+KF8BdfKSCo
	6HlzSU0uznrMGnfLh2kygMEw6B7W4ed/MX7JXoiN0S82Fs2klwBDWB5N8YvjYXslk/QLU2kAJ0g
	==
X-Received: by 2002:a05:600c:8b86:b0:4a3:59c9:a754 with SMTP id 5b1f17b1804b1-4a35acb17bfmr169457665e9.22.1793091049495;
        Tue, 27 Oct 2026 01:50:49 -0700 (PDT)
X-Received: by 2002:a05:600c:8b86:b0:4a3:59c9:a754 with SMTP id 5b1f17b1804b1-4a35acb17bfmr169457205e9.22.1793091049010;
        Tue, 27 Oct 2026 01:50:49 -0700 (PDT)
Received: from [192.168.188.234] (ip174-129-192-82.pool-bba.aruba.it. [82.192.129.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e542ed998sm6698767f8f.13.2026.10.27.01.50.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 01:50:47 -0700 (PDT)
Message-ID: <7136e772-513c-4ee3-b802-a9666fb8bdba@redhat.com>
Date: Tue, 27 Oct 2026 09:50:45 +0100
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net/mlx4: always create the eth and ib auxiliary
 devices
To: Peter Morrow <pdmorrow@gmail.com>, Tariq Toukan <tariqt@nvidia.com>
Cc: Petr Pavlu <petr.pavlu@suse.com>, Yishai Hadas <yishaih@nvidia.com>,
 Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, netdev@vger.kernel.org, linux-rdma@vger.kernel.org,
 regressions@lists.linux.dev, Leon Romanovsky <leon@kernel.org>
References: <20261020164239.3808903-1-pdmorrow@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261020164239.3808903-1-pdmorrow@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4gQAcXT1ZD8J0B8NWoQVih1dyHSflndmD_H6fcf9bdI_1793091049
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/20/26 18:42, Peter Morrow wrote:
> Since commit 7d22b1cb9d84 ("mlx4: Connect the infiniband part to the
> auxiliary bus"), mlx4_core creates the "ib" auxiliary device only for
> an IB port or a device that advertises IBoE. Before it, each mlx4
> interface was offered every device and decided in its own add callback.
> mlx4_ib_add() accepted Ethernet ports without IBoE and registered them
> for raw packet QPs only.
> 
> ConnectX-3 VFs on Azure have an Ethernet port and no IBoE, so since
> v6.6 they get no RDMA device. DPDK's mlx4 PMD, which needs only raw
> packet QPs, then cannot open them:
> 
>    net_mlx4: cannot access device, is mlx4_ib loaded?
> 
> Restore the old behaviour by creating both auxiliary devices for every
> device and letting mlx4_en and mlx4_ib decide in probe, as their add
> callbacks did. mlx4_ib_probe() returns -ENODEV when there are no usable
> ports, and mlx4_en_probe() binds a device without Ethernet ports but
> creates no netdevs, as mlx4_en_add() did.
> 
> Tested on 6.12.111 on an Azure VM with two ConnectX-3 VFs: each gets an
> eth and an ib auxiliary device, and DPDK attaches both VFs and passes
> traffic through them.
> 
> Fixes: 7d22b1cb9d84 ("mlx4: Connect the infiniband part to the auxiliary bus")
> Closes: https://lore.kernel.org/r/20261014133951.3219055-1-pdmorrow@gmail.com
> Suggested-by: Leon Romanovsky <leon@kernel.org>
> Assisted-by: LLM
> Signed-off-by: Peter Morrow <pdmorrow@gmail.com>

@Tariq, to avoid stalemates: this is waiting for an explicit ack from you.

Thanks,

Paolo

