Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.145.95.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793008844;
	b=Xcfqp6S5XJUD6xWAB1n9D+q1uEkkJKCvb8C0NwZb4J7mjfDcj6ZAk2FG0dX/cQTzp2M1
	 dDBS5Je/UHCUM37rIoUEoqU6KUm2ZaFvFe+DNMz/Y/AI2cb76s3G+wANXlgroxUVymnQv
	 BdPT8KNw3XLWE5HGm6ril8oyFZjrEbyl//PWN4/8Zq2GX4FTNnu6k7hj/IOPkPhpyLF43
	 u9rLEOFJGVwSSEhiLd4YDSAGNitqZKQ9z050DUUacj2M0BSqZ4zl4T0t2ukjpgbi79fMY
	 llvGsBs75vBalc0UYFHyrjHrZLiGr5j85QQIDWk1p13EZDVLlBlZa7RYBMTRQCH+3ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008844;
	h=DMARC-Filter:From:To:Cc:Subject:In-Reply-To:References:Date:
	 X-Clacks-Overhead:Message-ID:MIME-Version:Content-Type;
	bh=h3r2il0H80lLq9FBEl/2Zbfsq/ZTHqoGrukJv/jcN5k=;
	b=KKuF9MG5nAoWo4TGJld3MiqLMTKOBoJTSZNHs58vGUD9MKCH1mR5uABJBZ1UOQnbjTNw
	 tlEeNFaZErz6xPCNYfWcNjuxL9aSOIfJPzEnipmFe1P5jLlen5qs8sZDqLNALeo06WwY3
	 8/fhkx/OTYsQPtiypiu8J0rX+yhNspmRY6g8fiy6/s18OTMAlCf7gtIFF/9Ps+PsBNxRU
	 wl3pxAsU2BWPZlClUHyHto9rvx1ZgyJ/1IFsIH2bd8VKuSZkBn9XYwcftPqzKGv6R9RIx
	 5MuMB+vYdyGVHpa3gam038Bqj0ALkHhRwGwfSOagBef4tzzVxpZcXUgoFy9aHqC3Mgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=toke.dk;
	spf=pass smtp.mailfrom=toke.dk;
	arc=none smtp.remote-ip=45.145.95.4
Received: from mail.toke.dk (mail.toke.dk [45.145.95.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E31A606CFB2
	for <regressions@lists.linux.dev>; Mon, 26 Oct 2026 10:00:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E31A606CFB2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toke.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toke.dk
Authentication-Results: mail.toke.dk; dkim=none
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
To: Bruno Bieth <bruno@bieth.org>, Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
 linux-wireless@vger.kernel.org, regressions@lists.linux.dev,
 stable@vger.kernel.org
Subject: Re: [REGRESSION] ath9k_htc: AR9271 can't be brought up (-EMSGSIZE)
 since "wifi: ath9k: reject short WMI command responses"
In-Reply-To: <179300633675.74151.170245467704180950@bieth.org>
References: <179300633675.74151.170245467704180950@bieth.org>
Date: Mon, 26 Oct 2026 11:00:38 +0100
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <87ecdcpyrd.fsf@toke.dk>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

"Bruno Bieth" <bruno@bieth.org> writes:

> Hi,
>
> After updating from 6.18.48 to 6.18.56, my AR9271 USB adapter
> (0cf3:9271, ath9k_htc, htc_9271-1.4.0.fw) still probes fine, but the
> interface can no longer be brought up: every attempt fails with
> EMSGSIZE ("Message too long"). On 6.18.48 the same adapter associated
> without problems.
>
> I believe the cause is the 6.18.56 backport (e0c21130c1c7) of
>
> 93ce8ea70451 ("wifi: ath9k: reject short WMI command responses")

Yup, this was already reported, and a revert is in 6.18.58. Please try
that.

-Toke
