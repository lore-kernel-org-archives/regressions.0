Received: from nov-007-i538.relay.mailchannels.net (nov-007-i538.relay.mailchannels.net [46.232.183.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB38C8D1
	for <regressions@lists.linux.dev>; Fri,  9 Aug 2024 22:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.232.183.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723242971; cv=none; b=uBkPvPIoXRLxdTMFoJ2LNN/6n2PGhZjRtlKgjTezjuB2WV6cPVdSKhmr6I6Wyp4Uqc2hMlwpiSH8z/p0t/1Tk2m4ndLfg74jrfAu92IcE0VmWEfY7DkL+2TTfCxt7DSCPOW7hRXQbVkrhsnmRLhybDGEpnXiQHU6qyrVWiSsldA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723242971; c=relaxed/simple;
	bh=aP/hOF3NE3n2U2rR5esXT0nTIGcNIW7lIrmfXfwdq+g=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version; b=ik//mF357L8NRTmTj9sGU4749arifkydKcXyDKt3YMotSK+056pwySfc3Opzlr0O0mUeF2EZ0qLAt1uw2JcNPnwgEaqgRoPqWrl77Ku0SJz7Os9fpHjH42yc03hROC/aA0Xmqd9nSpIYwafAWR2O3Zo27/E19C4wQwRJ4m4kwbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bitron.ch; spf=pass smtp.mailfrom=bitron.ch; dkim=pass (2048-bit key) header.d=bitron.ch header.i=@bitron.ch header.b=E1UnsJiK; arc=none smtp.client-ip=46.232.183.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bitron.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bitron.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bitron.ch header.i=@bitron.ch header.b="E1UnsJiK"
X-Sender-Id: novatrend|x-authuser|juerg@bitron.ch
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 584846C003D;
	Fri,  9 Aug 2024 15:53:32 +0000 (UTC)
X-Sender-Id: novatrend|x-authuser|juerg@bitron.ch
X-MC-Relay: Neutral
X-MailChannels-SenderId: novatrend|x-authuser|juerg@bitron.ch
X-MailChannels-Auth-Id: novatrend
X-Celery-Troubled: 5685894b1f152663_1723218811960_1140344083
X-MC-Loop-Signature: 1723218811960:2640313969
X-MC-Ingress-Time: 1723218811960
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=bitron.ch;
	s=default; h=MIME-Version:Content-Transfer-Encoding:Content-Type:Date:Cc:To:
	From:Subject:Message-ID:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=5xVEy4feb3Ej8I1M7QxT41oUEdvWNYaTt4CMktm+C/o=; b=E1UnsJiKwvsaL7a6VnhQFd/Oag
	13r5rjEmi3iChIBXHY7TF4HCkq5Pj+cTJ1U4Eh0TEpByw3EPzaeHNQTN2ehE1R03SFtRJGabjtEVG
	2EV+W2f2r2I35zzBzEN7fYek4RtDfMMKVkvG3moB+RqKmkLO2mH8c7fMHC+KqbZOJlSyIZZvcVxTE
	UIoajd+55bWs6kG3u/uf6MeYgdFFok30YI+5biOJojZgxaR+mgThKxfBlV9QUoKwer9IH7WRUFXjF
	4jAvYWoedHGqM/iQ2ePlgprFi2d33G23j1RFGWxndLGCqay05Yhbv46abtDfxrpfEcA0tGPixQgey
	svsKlNew==;
Message-ID: <792a3f54b1d528c2b056ae3c4ebaefe46bca8ef9.camel@bitron.ch>
Subject: [REGRESSION] fuse: copy_file_range() fails with EIO
From: =?ISO-8859-1?Q?J=FCrg?= Billeter <j@bitron.ch>
To: Miklos Szeredi <miklos@szeredi.hu>, "Matthew Wilcox (Oracle)"
	 <willy@infradead.org>
Cc: linux-fsdevel@vger.kernel.org, regressions@lists.linux.dev
Date: Fri, 09 Aug 2024 17:53:26 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-AuthUser: juerg@bitron.ch

Starting with 6.10, I'm seeing `copy_file_range()`, with source and
destination being on the same FUSE filesystem[1], failing with EIO in
some cases. The (low-level libfuse3) userspace filesystem does not
implement `copy_file_range`, so the kernel falls back to the generic
implementation. The userspace filesystem receives read requests and
replies with the `FUSE_BUF_SPLICE_MOVE` flag.

I'm not sure what exactly triggers the issue but it may depend on the
file size, among other things. I can reproduce it fairly reliably
attempting to copy files that are exactly 65536 bytes in size.

6.9 works fine but I see the issue in 6.10, 6.10.3 and also in current
master ee9a43b7cfe2.

413e8f014c8b848e4ce939156f210df59fbd1c24 is the first bad commit
commit 413e8f014c8b848e4ce939156f210df59fbd1c24 (HEAD)
Author: Matthew Wilcox (Oracle) <willy@infradead.org>
Date:   Sat Apr 20 03:50:06 2024 +0100

    fuse: Convert fuse_readpages_end() to use folio_end_read()
   =20
    Nobody checks the error flag on fuse folios, so stop setting it.
    Optimise the (optional) setting of the uptodate flag and clearing
    of the lock flag by using folio_end_read().
   =20
    Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
    Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>

I've confirmed the bisection by reverting this commit on top of 6.10.3,
which resolves the issue.

#regzbot introduced: 413e8f014c8b

Cheers,
J=C3=BCrg

[1] https://gitlab.com/BuildGrid/buildbox/buildbox/-/tree/master/fuse
