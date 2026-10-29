Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793271124;
	b=MnPzaa3qvnYsa37pJr8M7/4JJP/RPdqLidSOtYH02I2lGNfkUGP7EKbsm68JQfJ37BAz
	 hjAoIYv+8dCK6M0lkHBivprFDIKPh7gw5DVkQZCkx/pUTi7YBMmpEOFQex/JcJM7fkmEb
	 KwzvOvKyKlOsPlETqw72Xku2KwmOwwSXGTJGuEQI4sGAsXOYR8QC+CwuejJQbCAYDL2fs
	 a3xi7eztHCalixT3CcQmFOlMoVj2+EI2LuoRxzV8D03QZ62+yJxTNs5qS/v96B0VLuLnf
	 PBnp0OXn3DnCRv054WDM92X1kCpYUOLTiocJ+4eyLm76AmeYKuB4s4dPdXYHMm6eYAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793271124;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=iymo6yWih1u6JSkjazwtYJq1W+j31tigL1sbJo3i2bo=;
	b=nn+ezr/BMMFVg75htIo8u/DnnnqC/+H9kYF7JGbRaGFSjXQRyR03Al+iR58FyYI5cpVJ
	 XDfc56T7LVl4WX9gts4h7hHP7ukrQUc1awWkS4duCZeydK5xwdx9/1sKeHmak43fhNpZz
	 ObLLp/q5o0PXPHCKcSEoOEq9QUNOZB1mmnTBIwbuhoy7Wchq4glt1TsdboVLhXNwcJ9fu
	 yW7Ny0qYAi1+sag3xkwYpSMxZWZFHqfQEZcensb+aDrfX7AXHTiT1QLDgEworb4vtAK8R
	 +zXQK1EBwnmppobX6B/257OFA6mGzTEu2dMFBAllEJ+q/G6cNkxjU8Xj44pBwE+9FHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bFEupz7p;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F70606A322
	for <regressions@lists.linux.dev>; Thu, 29 Oct 2026 10:52:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00F70606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bFEupz7p
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-15ea896ddc8so2916246c88.0
        for <regressions@lists.linux.dev>; Thu, 29 Oct 2026 03:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793271123; x=1793875923; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iymo6yWih1u6JSkjazwtYJq1W+j31tigL1sbJo3i2bo=;
        b=bFEupz7p9o9ns23qIVYOR0taOFztONyE5Ro5YBkHwqQHeZR5tGFJKWF1D3/IQ7vdgI
         Oy++Oj/60hHGtXoHf1DteG8LcI0s64ous/ttxygqitbeUtZ+KDN9UsR5LXmQzJQoHnUI
         KJUWXRmmdLPf/faVbRhD3iHv5vuSr5xH0H8OJ4p1HqBsfDdzWmD23goJ5fJsJzxfaeKb
         AZsShJikhM8OAeS4Xw3xL/U7KxG7IrYGluqwJhQ4n06Cjuw+464u4bfvUIuAZFNXtyxz
         PzBKjzNoqNPRCmtVwhVhw7eRxy7f+QzLys2WVDk0Sns47P9MANw2AbC97iEgJxMLQ469
         wtPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793271123; x=1793875923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iymo6yWih1u6JSkjazwtYJq1W+j31tigL1sbJo3i2bo=;
        b=zBCTKUcAzKCett3Y2MlKHT8U0xbjEAFd67ptFu585YAr2eoSMWVzg3WX+CdYIl4TmO
         b6vm5SIQXh2S1J5REH9vswg1fgN9LUI3SlWdmxHd+VZe2U32qCjKr6BB+NPLcDpYm7Oa
         T4CDI8r/5FhvDO8Q8Klx93iBKpNCBxgBjqjmRUiYWSnS54jR8cr/5FMK3fo8rtTmnj70
         nS0tPBiMlfxeh+b5ivqBM9GyzhsP+TVNTchC8ggAei5yRmFdZ958sHpVjFc7QcIEZCHG
         u6oB5R+Ye1htBhaAoBGAh1lFh00f4f7Zku9kd/UQw+PfEY3MYuOaP1giD1hU75axOTY2
         ZMfA==
X-Forwarded-Encrypted: i=1; AKwUvBwZ/rmBGswrDoq9Dcl7FG8iKVwvoP9fCcFMxH8UM9EqB6/LhMH7838zHjKeG6Bg6Up9U7egogbjzOFTAQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYLjDO9UXOXJN+8RFi/Jb5nvLmDX8yy//1bE2uRuvaVkE3dovaP2
	UGvyGRJiE8QDTZ1jf6Gk8pBU4VtA6X/qX0kXsVhlx/SU2ijtajZBa8P3
X-Gm-Gg: AYBFou0Rjsa2YBGnFXI0X4HQ5mClVaTBBjJkWDzmveFPI4KG3agQJ6aaf8KWIApNADl
	gR2MnJDz0bfxhYfZU6fWey58X/FeAlAjRbmhdYAaL5/1iO8uu2dj++pl0LhfRHJY0V1XhvYaIz2
	z8bG9JZWSWErk9v/wcpMnTBDl/TZedzD87yozBHags3rtvy9fFVPsWF3iMaajTQFsTnlBMv1JQ6
	+q7BDoXDyy2TXnPYDQHrm06nR4dbVyDgr/MWDF+sYqOSAR5spMrlN6etY8jw2FUgZ07J6mu2YXb
	0TmKvez6pTz2MwsjqHiM4Q4Zso1hiv4gNBbxRvMZ1gk/0FY0cHY343UElcDoCq9IT8Xe0oPVStO
	13+taEs5BtvtvyQWv+a20llLJOLk9CFp9hcdy3cZXvyaBW/LaG7DggwpLmx5OEwlBYw/CUkVZU0
	EqIcnIfQixyXauSfE/cLJbX9/D5ggU125fLM879jkMQZniF+1Ur5Qr4OFgqwTud6e4yd1luvlBR
	82qomzUjmXppIpqKxb4RjCC+FQtZChtuiTZRrpYGZnYWJAPuJl/81VFqzqQ6SRl/F5KdfQ6Ckpy
	hYTkj8QuIqR7778cOID1ASq9/dBdXkdiDsmPNpTMaCZZ
X-Received: by 2002:a05:7023:c081:b0:14f:8e70:fad0 with SMTP id a92af1059eb24-1a6cfb045camr6418261c88.33.1793271122885;
        Thu, 29 Oct 2026 03:52:02 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75c9fd2b4sm14692245c88.6.2026.10.29.03.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:52:01 -0700 (PDT)
From: Joonhoe Kim <26rote@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	christopher.lew@oss.qualcomm.com,
	deepak.singh@oss.qualcomm.com,
	pranav.phansalkar@oss.qualcomm.com,
	andersson@kernel.org,
	effeffe99@gmail.com,
	linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH net v2] net: qrtr: announce local services again once our HELLO is sent
Date: Thu, 29 Oct 2026 19:51:57 +0900
Message-ID: <20261029105157.2553-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <at9mFUv1flg-6aMB@debian>
References: <20261022163116.1042-1-26rote@gmail.com> <at9mFUv1flg-6aMB@debian>
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

On Mon, Oct 26, 2026 at 08:11:56PM +0530, Manivannan Sadhasivam wrote:
> > +	if (cb->type == QRTR_TYPE_HELLO) {
> > +		/* Pairs with smp_load_acquire() in qrtr_hello_work() */
> > +		smp_store_release(&node->hello_rcvd, true);
>
> smp_store_{release/acquire}() accessors are only needed if there is an ordering
> requirement. But I don't see that exist with this 'hello_rcvd' bool flag.
> Wouldn't {READ/WRITE}_ONCE() suffice?

The flag is ordered against node->nid. qrtr_endpoint_post() assigns the
node id with qrtr_node_assign() before it sets hello_rcvd, and the
replay reads node->nid after it sees the flag. For an endpoint
registered with QRTR_EP_NID_AUTO, the id is only assigned when the first
packet from the remote arrives. With READ_ONCE()/WRITE_ONCE() the replay
could see the flag and still read QRTR_EP_NID_AUTO, which has the same
value as QRTR_NODE_BCAST, and the name service would then send its
announcements to every node.

The flag cannot be set under ep_lock instead, as qrtr_endpoint_post()
can be called in atomic context.

> > +		to.sq_node = READ_ONCE(node->nid);
>
> There is no READ_ONCE() in the earlier read. So please justify why you added it.

node->nid is read again here because the earlier read can come before
the remote's first packet and still be QRTR_EP_NID_AUTO. That is fine
for our HELLO, as qrtr_node_enqueue() takes the destination of a control
packet from node->nid itself, but the replay needs the assigned id.

The READ_ONCE() is there because qrtr_node_assign() writes node->nid
with WRITE_ONCE() and the other lockless readers, qrtr_node_enqueue()
and qrtr_bcast_enqueue(), use READ_ONCE(). After the acquire the id no
longer changes, so a plain read would also be correct. I kept it in v3
to match the other readers, but I can drop it if you prefer.

> > +		qrtr_local_enqueue(NULL, skb, QRTR_TYPE_HELLO, &to, &from);
>
> What happens to the return value?

It was ignored, and a failed replay was lost for good, as the Sashiko
review of v2 also points out. In v3 the replay is retried 100 ms later
if the allocation or qrtr_local_enqueue() fails, without sending our
HELLO again, and it is queued under ep_lock only while the endpoint is
still registered:

https://lore.kernel.org/all/20261029105142.2503-1-26rote@gmail.com/

Thanks,
Joonhoe Kim
