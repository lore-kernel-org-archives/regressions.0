Received: from mx.manguebit.com (mx.manguebit.com [167.235.159.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99EF91BDD3
	for <regressions@lists.linux.dev>; Sun, 14 Jul 2024 19:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=167.235.159.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720984838; cv=pass; b=shvDXaeeJ3qiyS2IggVLa2KDpdA+wm4SgVw6v7+t9lARo5i6CEJQ1dSgyhA50+6xaKbqdog9GUAG2UFxiBtZs7mLlhevV0TzBJyZvH1FnqyBVVUXMfU7q9+u7LVMW15TdhQ3+ige1+eTkma/PtpSppeOomezo2Utr0CnslmJ9CI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720984838; c=relaxed/simple;
	bh=/FcZ9N1c4VlhCvMsxwcRFAnyKtuw+w7WfA9ghnPfVj0=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Date:
	 MIME-Version:Content-Type; b=DHcDvEqrefoh6gqEDbJduYgOo3w2T2edLR/fMGMLub/OehGplg0Vdy5GEwOCJB30JvadnRhxi090ZymkeVbrrnTTbg8awNMiyyLfjWoy7XFLm6sT7f6mnPkGPklyUM9ICZfvdOJzxFOCZS5lVamqBPulB39YHaWZL5hfX5A9KMg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manguebit.com; spf=pass smtp.mailfrom=manguebit.com; dkim=pass (2048-bit key) header.d=manguebit.com header.i=@manguebit.com header.b=AaINHtOa; arc=pass smtp.client-ip=167.235.159.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manguebit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=manguebit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=manguebit.com header.i=@manguebit.com header.b="AaINHtOa"
Message-ID: <0ff960c2bde0f213cc9b7ef98b993bfb@manguebit.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manguebit.com;
	s=dkim; t=1720984333;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k0qixKwhN6tzqluWu6/T48t7L7Ai9CTcLb/etE0sBoM=;
	b=AaINHtOaH7ifXZT8SD2wGllbEMQLlQoP0M0Qyvos9isOjZOSdyy2OqgnbevzcRRq1J/MOk
	paBiEtRKC/QG6pXPL7zXpT4LTeXTea/1wJoGlbwP5h3jtx4O+rhHS790SaM1bJErPjT+Nv
	DST6i7Z6ynzb6m01BXizGs2wg8JFANCXnmV+FYn7x6u8qnC32iUph741D/qSig6FxoTYWR
	votlutiNdrZjO4Fl2oPo+jhYObFCuUf5+xXjCm3doMNWtO+gx+Nhy7Fsk9LNL/vcUILNka
	6cEcHsbUMpwAsGIWZ4XfJl7vkkyes/WsplaVMs9K7B11YBq2t0tmGlmf11vMCQ==
ARC-Seal: i=1; s=dkim; d=manguebit.com; t=1720984333; a=rsa-sha256;
	cv=none;
	b=gXovMOtnBXS2D8dD398zcVEWJz9q2LjVxjNWf1bsCpODT2xlh8kO8kUzOQvlwZ/IYmi5Sa
	W4p1YWdJag8cg7EiSI0TbK/xPKDB/S4OXzxnINH7HM8fkjrjJOVRBN2lN4F9KgQAcLGF2w
	vli7mGgoM5OIoWrhYjts/gThjg+7bz+BI8vbZoJSlbCkyV2Sr0ogwv4OovqmhEB/dULfxc
	m7f0C5yvbamjxQNFUsuxJRMs7nqx9Gj9zhtXucrXZZdijZxzoSBe8eb9gL0Vz7uCkKsJ84
	pEUCY/v1XoKr9q7nEQ3r0EYkvmI23ca5xEUwb5/T7SWde8w35EWm/b4ZOFQQOA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.mailfrom=pc@manguebit.com
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=manguebit.com;
	s=dkim; t=1720984333; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k0qixKwhN6tzqluWu6/T48t7L7Ai9CTcLb/etE0sBoM=;
	b=dQd0u+FyK/QyXSz1FkfigxrSAQB9TLz3kSXm2q3vroi365/QCQZtrJKYmVpKSOI1TFLJVY
	1DEACYcJMZFOLdxmT7D8el1Y3kdUzNKhph3Xuw9L7wDp19+0dkXS7zlAX8qSy3XTj4iNTy
	rWefJqPyY/+3Dfg06cDnpRkmqrHNuLKMr74WzRDlNapb8slbLl1gtau3p0AGhKE3aRneIF
	1+MNYhdvjzlzzVk6wU6xOqjK+rWdn1Czqq1wru7aFWzuE14FnIzquMTmSPHFXRmsBAYev5
	MlT7h3/BeKxVefeBkWexQ/9HJK8h3V1MWTqEoPzihQZGdmXMEFp2AEyMptUeUw==
From: Paulo Alcantara <pc@manguebit.com>
To: =?utf-8?Q?Steinbei=C3=9Fer=2C_Sebastian?=
 <Sebastian.Steinbeisser@lrz.de>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Re: Potential smb/dfs regression introduced in kernel 6.6
In-Reply-To: <5210f9e7b720dc1d150bd2ebd9f4edadf39685aa.camel@lrz.de>
References: <dd878fc236840921d3e31944e26694fed941d0c6.camel@lrz.de>
 <f3a02647b6fcb27a70da4c334930ad3c@manguebit.com>
 <9654b28ff276b5b78ffcc3078bd4dd1ccf80ec73.camel@lrz.de>
 <5210f9e7b720dc1d150bd2ebd9f4edadf39685aa.camel@lrz.de>
Date: Sun, 14 Jul 2024 16:12:09 -0300
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Steinbei=C3=9Fer, Sebastian	<Sebastian.Steinbeisser@lrz.de> writes:

> Is there any additional information I can provide?

Yes.  Please provide again the network traces of both working and
non-working kernels along with the session keys in order to decrypt the
packets.

You can retrieve the session keys by running `smbinfo keys
/mounted/share/some/file` [1].

Make sure you can decrypt the packets with dumped keys before sending
those out.

Besides running ls, try to stat those files as well.  If you can provide
network traces with smbclient(2) [2], it would be great, too.

Thanks.

[1] https://wiki.samba.org/index.php/Wireshark_Decryption#Obtaining_the_keys
[2] https://wiki.samba.org/index.php/Wireshark_Decryption#Samba_client_and_=
server
