Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792686752;
	b=5U/ga6fyVSj2yl+Quu3s4s5FDTKvBfvXjzr1luMM7vTYL7I/Uae7tW0zZEpIBtEk+bAN
	 1nGWT0lofBUVCb9zuJHLKzRUoOyETn/kHeksiLh+aniIHQKIY1ZkuRmjSnwzr21KQ/37N
	 kX1MQtnqc3Xt/NY+txon21Zvyj0+efiUHqqnt2OduCO6SlOcgGN64uVgsLC6XWFED0iUV
	 b8Pv7/zYjEBVslzTDkOk5fiPQjb+4AvZoleYiCW+RSgQGnOy6AWHGBvItKVHYJk/9zZ68
	 2MI6GdAJ53xQoMJOJYYRhr3/Su5zlqHWExq193mCtEtW3TjCfodvR3/FVWHbgyy0s/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792686752;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dyDoCHAK3x3k2IkUzfNota+vU5adkAbdwanSXQJIy3c=;
	b=3TCN+EVHfa0FZvo0ryAaXld9WWp0BwTV5IT80TY4px+goJOLD9lE31IygGAHc4pUHj6O
	 PAEm3lyeTgucMi5q7OqkGzoC8Xj4AYxc4ykIXrujR9b5UDQdna1tRn6/9zZrtZzTnizl8
	 YbDuKDELmyermNvTae8Aq39PEw8Mgc94tmbqIgb+4oVgNZVRcjy7NhRpgyLguJ4TuBACA
	 3NUfAJgCzIM0W3RcPSYWGeYjaJdwn++XXiAK+OfHK9XAaa+ZScuMJ3An0e9iJTMJt51aw
	 MudLTW+aTCy/zO20bH2gsCttqzlhl1p1hyAmvHroA0rJd+ZUQIqLRnrjfkP18GxbsKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eXKyltPd;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42081606A31D
	for <regressions@lists.linux.dev>; Thu, 22 Oct 2026 16:32:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42081606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eXKyltPd
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3282db206d3so40483eec.0
        for <regressions@lists.linux.dev>; Thu, 22 Oct 2026 09:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792686751; x=1793291551; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dyDoCHAK3x3k2IkUzfNota+vU5adkAbdwanSXQJIy3c=;
        b=eXKyltPdZby0saGdbRHTO1OKupMj+KZyj3y7dhaVkUSSm8PxhnvMK4TgaMemN+oIHV
         qZYcXy79IgQeTcNvGw9ww5MICoaVHOBAT3+26Ze6PMQdXqLpLnuGjGsxaS1RiaoQ8Euz
         Rii/4dO9YqLKrI8DiP9UW8LKZ73YD50LiHPnGvFNglkoD7Fc1Uqh8fhZ2hQpbls7tNdc
         wZB7bRmyCzu+h19nWQfVhJlNNpJK1mUikT1jEE21JF0NFKs6cR1CmCZiBv61ooWWwvk6
         8lBd81O4Wz7ygXJ0MYaKZEOsA0/7MpZ6gGWKXE6tR6nnIU3jfGv6rVwtJQWgpCi1kFG5
         3pGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792686751; x=1793291551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dyDoCHAK3x3k2IkUzfNota+vU5adkAbdwanSXQJIy3c=;
        b=S+KBTh0yRvRSxSAuxQqhyGvcaw6+dRQp+fnUwFCxDKu3nwduDysDpi6gbXaDkXnKtH
         ERuPyjBtHC1JcALiFzdFGcfKWxW2q4043LgF7DXCE8XVJL1eUYncHS5GG+2XOWRtBfAO
         JxLCCZ59t5Gei5k7glkyQfCGrzdPLMKKbpXX6FDqYfggWCV490i7+55serjR5PCkDDwa
         1JpdSzEHayFMvHksV8zX3x2T7PKH8JpbvmXemSbUWz/ROq/wgctnFf6Be0v8v/KdfC7M
         DtRqQy0ezehLY1MY2T5MKR/xMkT4HZu1doWodQThA9BdWZKURcRcidtEdmirYaLFuPLF
         uqAw==
X-Forwarded-Encrypted: i=1; AKwUvBw6WkJvXeifR1wA9qjVq273AIMBF8xBIlkPqT/L8EGdtYc0gS/8uONiOgmAvw3X67HTphvIg/NXCXhpiQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYI7fnTAbIMONlqk3c1v9ocEqGEsteTv4wfP0BP6kSVml0KhCDg1
	qZygH1z5FocCE2tfMuBscm42slkmBgONPV+Y/LhaSVpAlnZgOLvR+trx
X-Gm-Gg: AYBFou0NusT0xZleVHcbTGsYA15hE/YYOIPB0VOFe+Q3kAoMSEkN49bmilw63epCDPK
	YfTq1HyCwPKOpQiCIKqkNw/YqP9mzXPSisGLoCJEdVSOLJ03v0FagZjFY6ASN0yRJmRmjuSnvHr
	JVcpxnCh+1zMaouMGlrRLdHf+7bzmcTYnSd5+yXAuRWEQkvJlY/sEHHdum34aao8isTkcymNpGo
	N9ssDjm+JZSlIq7Q5YXHxbonvxVDSDn95XD+egwuouzHlujMXnaXJzy+GtJuIancuz3Jg3JaWN2
	Wf6vrYlhLRq3X8t72Yj59fM6Jo3VzV8rlKb7tGNcKZSWzn1znMb47ns4rTNnvS7vS4CvRi+mjvD
	DRQyXzB24Lmy85AofOr0CeVFYisnl50bx1p3b6faYSgI8eBAeYaLWwh7i6R2FW3OTubshpqaMvJ
	xiAN6BEEiG7ckmQAytLBsK3h8B0dwtu1hobPDXQmeYVh2dFOQBcozrbnlo4VQadPeMmYvQyUYb6
	JDuWMw5gTB+Riz/uf9lLvnZ2DMvbbs96xCPGZcESLcmTB+1lAKOAbGVgiVZ81jSc+2HzdLt0px2
	PsvkU52iHhGWygl8
X-Received: by 2002:a05:7301:18a1:b0:359:9302:a526 with SMTP id 5a478bee46e88-3674c93ba42mr7166066eec.7.1792686751237;
        Thu, 22 Oct 2026 09:32:31 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36741e71eaesm37214243eec.26.2026.10.22.09.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 09:32:30 -0700 (PDT)
From: Joonhoe Kim <26rote@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: mani@kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	christopher.lew@oss.qualcomm.com,
	deepak.singh@oss.qualcomm.com,
	pranav.phansalkar@oss.qualcomm.com,
	andersson@kernel.org,
	linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH net] net: qrtr: ns: retry service announcements on -EAGAIN
Date: Fri, 23 Oct 2026 01:32:23 +0900
Message-ID: <20261022163226.1091-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <179250109438.3135.5278679700614096504@kernel.org>
References: <20261016124600.31-1-26rote@gmail.com> <179250109438.3135.5278679700614096504@kernel.org>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 20 Oct 2026 12:58:14 +0000, Sashiko AI review wrote:
> - [High] The fix only covers one of the two paths that send NEW_SERVER.

Agreed. A service registered after the remote's HELLO has been handled
but before our HELLO goes out is broadcast from ctrl_cmd_new_server(),
and qrtr_bcast_enqueue() drops it without telling the caller. If the
local node had no services when the HELLO was handled, v1 has nothing
to retry.

> Could this be handled in the core instead of by polling in one caller?
> For example, packets could be queued in qrtr_node_enqueue(), or the
> announcements replayed once hello_sent becomes true.

v2 does the second, as you suggested: the core records that the remote
has sent a HELLO, and when our HELLO has been sent to such a node, it
passes a HELLO from that node to the local name service again. The name
service then announces every service it has at that point, which also
covers the dropped NEW_SERVER broadcasts.

> The same window opens again after qrtr_endpoint_hello() clears hello_sent
> on resume, because the nid stays assigned.

The flag is not cleared on resume, so the replay also happens after the
HELLO that qrtr_endpoint_hello() schedules.

> DEL_SERVER broadcasts from
> server_del() are dropped the same way.

v2 does not replay these. A service that is removed before our HELLO
goes out has not been announced to the remote either, and on resume the
remote has been reset, so it has no entry to remove.

> - [Medium] The new retry loop in announce_servers() (ns.c:232-236) can
>   stall the whole name service for about 10 s per remote HELLO.

Agreed, this is the same problem Mani pointed out. Nothing sleeps in
the name service worker in v2.

> A HELLO that fails with -ETIMEDOUT or -ENOMEM leaves hello_sent false
> for good.

That is a separate issue in the core, and v2 does not change it. With
hello_sent false nothing but HELLO reaches the node, so the replay
would not help there.

> - [Medium] The NS side gives up after a fixed 10 s, but the core keeps
>   retrying our HELLO with no limit.

Agreed. Any limit in the name service can expire before the core gets
our HELLO out. v2 has no limit: the replay follows whenever our HELLO
is sent.

> - [Medium] A retry can re-advertise a service that was closed during the
>   retry window, and the remote then keeps the stale entry.

v2 has no retry window, but the replay is one more HELLO for the name
service to handle, and the ordering race you describe applies to it
too: a port closed after the replay is queued but before the name
service handles it is still announced. v2 does not fix that race.

v2: https://lore.kernel.org/all/20261022163116.1042-1-26rote@gmail.com/

pw-bot: cr

Thanks,
Joonhoe Kim
