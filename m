Received: from buxtehude.debian.org (buxtehude.debian.org [209.87.16.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C260250A67
	for <regressions@lists.linux.dev>; Wed, 20 Mar 2024 15:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.87.16.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710948434; cv=none; b=Bj2FMchI+ywpArrBqmchtZUd3bmhFZxsa1qexl7u5NrjFp8UWaPviNz5VZUXGeP9Vu3QTCichQOxTJo+u1YDTQijo8pXLFfH4IB3RiMtzUEdQF0Zw2UvQH5rhQLq3AQkIYooAR1oKvJI0Ppkgy5zbeOXkflUWTVlweB+LZRfp54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710948434; c=relaxed/simple;
	bh=M8ryrLHKnGhOOpG4u8DHjzLiwZHDZdjSsUtCvI+yBOI=;
	h=Content-Disposition:MIME-Version:Content-Type:From:To:Subject:
	 Message-ID:References:Date; b=FqcITQsADidtoGB8df4yohpxuuqd6BE9ahMWwKUeWw9TydNFPaiOJX9Y2JG/dMxO/V7n95Z3LrD2S21RWgmdupLoSI9f2/f+unyPI+ZMaxDEpp+3hD5KaeUIy8n5KUqEC4t1CJd9pNgmgJ7qbiHTQuu51nYpRd6NtLa2if9kpxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bugs.debian.org; spf=none smtp.mailfrom=buxtehude.debian.org; dkim=pass (2048-bit key) header.d=bugs.debian.org header.i=@bugs.debian.org header.b=X5YIT+vz; arc=none smtp.client-ip=209.87.16.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bugs.debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=buxtehude.debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bugs.debian.org header.i=@bugs.debian.org header.b="X5YIT+vz"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=bugs.debian.org; s=smtpauto.buxtehude; h=Date:Reply-To:References:
	Message-ID:Subject:To:From:Content-Type:MIME-Version:
	Content-Transfer-Encoding:Cc:Content-ID:Content-Description:In-Reply-To;
	bh=M8ryrLHKnGhOOpG4u8DHjzLiwZHDZdjSsUtCvI+yBOI=; b=X5YIT+vzjO/VCw5qvURtvlU5vC
	NvtPLT+dZ62/Xvn81Bdk4eJQhvQOMCWu1Vrvd1GDLTeQ8kICRFnFGuk4mdnzlVPInLUVdrwGCAWVX
	iCJ//cHI3Tsq0mmk2atkfd4vc2K0G1Ke3rRs9XOeONnJIPGYNl00CRrcYsUuOsFsnesmATCJbxGh8
	//uaMtmio+rutScvQCjl2IP5OnejaPTUQrcBE7f0zq3WB3/XwDApufZWEkZs7tGYDT+w0FtuvzVd8
	5NF7wKLUiBWRdd/sy9qdhvhBodX3843gKb7rFxJ2m0MxThv4+NM2ivkiDMv5v0sJCwuaX0F84+Poy
	9pyXNnLw==;
Received: from debbugs by buxtehude.debian.org with local (Exim 4.94.2)
	(envelope-from <debbugs@buxtehude.debian.org>)
	id 1rmxqL-00AZs5-Vq
	for regressions@lists.linux.dev; Wed, 20 Mar 2024 15:27:06 +0000
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mailer: MIME-tools 5.509 (Entity 5.509)
Content-Type: text/plain; charset=utf-8
X-Loop: owner@bugs.debian.org
From: "Debian Bug Tracking System" <owner@bugs.debian.org>
To: Linux regressions mailing list <regressions@lists.linux.dev>
Subject: Bug#1054514: Info received ([PATCH 1/1] drm/qxl: fixes
 qxl_fence_wait)
Message-ID: <handler.1054514.B1054514.17109483612520765.ackinfo@bugs.debian.org>
References: <db4c8e74-5c79-49be-9781-a5d8669eccc1@leemhuis.info>
X-Debian-PR-Message: ack-info 1054514
X-Debian-PR-Package: src:linux
X-Debian-PR-Keywords: upstream
X-Debian-PR-Source: linux
Reply-To: 1054514@bugs.debian.org
Date: Wed, 20 Mar 2024 15:27:05 +0000

Thank you for the additional information you have supplied regarding
this Bug report.

This is an automatically generated reply to let you know your message
has been received.

Your message is being forwarded to the package maintainers and other
interested parties for their attention; they will reply in due course.

Your message has been sent to the package maintainer(s):
 Debian Kernel Team <debian-kernel@lists.debian.org>

If you wish to submit further information on this problem, please
send it to 1054514@bugs.debian.org.

Please do not send mail to owner@bugs.debian.org unless you wish
to report a problem with the Bug-tracking system.

--=20
1054514: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D1054514
Debian Bug Tracking System
Contact owner@bugs.debian.org with problems
