Received: from mx.manguebit.com (mx.manguebit.com [167.235.159.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD7A5661
	for <regressions@lists.linux.dev>; Fri, 26 Jul 2024 18:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=167.235.159.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722016816; cv=pass; b=ZpkWUvE2HUQZFA60RkJnPqTFx4ex0WBlLYRn8YlDFw/GlXpcbNZBu9n9ORMmD+Zd0fgQvkISnCv/Q20XFyfZZpT6JZOytBpotDN90Ttdvy/W8/PypvGZx0g8W0xZMOYuzwoFnDszVPImi2f3Ttdz6Qwd+Gk5AbY+H3HAUomzUjs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722016816; c=relaxed/simple;
	bh=/QxxV53B7TKlTHAg1CbBXfLP6Ja5x50Gljoy04IwgAM=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Date:
	 MIME-Version:Content-Type; b=AX29W0aG0vcKq1IDTulS13i+jsGo++4862SAln5lEJqdoLPIxRovoN5pyCxHRrLKqYQHD0p7kjh2uhlpMoIaODSJN+E7nWH0tj8j7vEMKnFZVLjGuEEWPZKkLrnVPhtwvvt7eLRr7z+CoG2x4ohWtPUCcGerOMJTMJaL2qPcb7w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manguebit.com; spf=pass smtp.mailfrom=manguebit.com; dkim=pass (2048-bit key) header.d=manguebit.com header.i=@manguebit.com header.b=foKIPS+a; arc=pass smtp.client-ip=167.235.159.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manguebit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=manguebit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=manguebit.com header.i=@manguebit.com header.b="foKIPS+a"
Message-ID: <1b5c2b978faac9e5f14f1de4e7c57f32@manguebit.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manguebit.com;
	s=dkim; t=1722016806;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gazRt8U1zHUMH5FSe1dGfI6wbPzLN80MrjUUb3ctapE=;
	b=foKIPS+aHB4XYzsBvaaz8FzWu5xNPJ2UK+c3ilKYw930ospCLv9vcYfil+7I5mvq3D502k
	5X3tIbsiVPDjzfD5La14Qs6sBiWiMyX1LcN1NXwI0m+n2ZkpjqHntZYWKNJoUaIYUE4veg
	vY+PBz3HB252tPMEjBoF3Codh0orLCM1TSe2Y8ZJPep+zGKX/zG9PSd8Sw7pvFgRWEs/hp
	GJUaeO41AFTgqbIIbCjTHkUL307mWV0tt1aEm+EPKdg4wcusYYIuI/a/mk1JUM83i5SKWn
	aGW2EXW2fQZ+euDsaJj8+qQS/4PehwrmkYApbQOEOJGrJVCFU+un7Po1YzXabg==
ARC-Seal: i=1; s=dkim; d=manguebit.com; t=1722016806; a=rsa-sha256;
	cv=none;
	b=jrdWkwX2lGr+ca3jZCpYz/XC8U2nxMTujXEB5hhJgz49H+fepouVTrimuXx0bnjCHXKN2o
	Y7u0x3Pn1LsdyzO46Nmb5rSwIX4CyAalb3xyO/aYRDVAJ9S81h+dZxzz5tADm3KaTXLInB
	B9nkBiYQcWxSbGbht5sobgh3losuWhNRxJ6cpLdvssFNKFAhkVn1XGsX6pghAw/e4TZW7G
	u5nifwbbbTc0IPFpwGMdsCfNGXcghzQu/R+jH6NbceT7Q5R1SDvdT2OotSI8f2AmrmF3I9
	e45OaTRAMk4RDmsdLBnuiR3x045DjIQ1A2eXEIc0XzXcKficII3ruEUX+Lr3Fg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.mailfrom=pc@manguebit.com
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=manguebit.com;
	s=dkim; t=1722016806; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gazRt8U1zHUMH5FSe1dGfI6wbPzLN80MrjUUb3ctapE=;
	b=Wk3V3I4nPRiMsO/GKLKlC05Xxeh/2JagLZcX0pDtFQQj9hUtupr2Eurctsc3RLh1ZQt1Oz
	4flPKki/mJt7gV1DxYAR2YddogjEdZQnjkgsy6YPKWFwF/kmtxoSoI2dB1Gl3jmmU9idqJ
	kHGU6oZyMQF5N5HnCvouJ5SYg8w2PGbq0gkEa7LzhF7p/+Q2nq8zxEEU7wv3gJzSiBwRdO
	V2em1RB5bZRE+GPB9kdJy3V9SG1WK3tftNRs8a27LbVN3EMZOGDUkthpaejXC+ocVlYGL8
	F5zFublkiSa7HU+nx71tcvnzpSs3ZWOU75sgQI61T1FCI0nUi3ai4FivDixSGg==
From: Paulo Alcantara <pc@manguebit.com>
To: =?utf-8?Q?Steinbei=C3=9Fer=2C_Sebastian?=
 <Sebastian.Steinbeisser@lrz.de>,
 "tom@talpey.com" <tom@talpey.com>, "gregkh@linuxfoundation.org"
 <gregkh@linuxfoundation.org>
Cc: "smfrench@gmail.com" <smfrench@gmail.com>, "regressions@lists.linux.dev"
 <regressions@lists.linux.dev>
Subject: Re: Potential smb/dfs regression introduced in kernel 6.6
In-Reply-To: <c101642079d4f0c54edd681c70b8ccf37f4f1982.camel@lrz.de>
References: <dd878fc236840921d3e31944e26694fed941d0c6.camel@lrz.de>
 <f3a02647b6fcb27a70da4c334930ad3c@manguebit.com>
 <9654b28ff276b5b78ffcc3078bd4dd1ccf80ec73.camel@lrz.de>
 <5210f9e7b720dc1d150bd2ebd9f4edadf39685aa.camel@lrz.de>
 <0ff960c2bde0f213cc9b7ef98b993bfb@manguebit.com>
 <dd0259752e3557fa1b60dda4db3bf790d9ff877c.camel@lrz.de>
 <4b718a0b9a967d4bc0428a3f706e3b15@manguebit.com>
 <98d458ba-4258-4598-b8fc-0fe6cfeb2f87@talpey.com>
 <2849de0676a015619b922708005a243595f9f56b.camel@lrz.de>
 <6db3dbb8a7a6f4f5ed0f63d0e0c784c7@manguebit.com>
 <c101642079d4f0c54edd681c70b8ccf37f4f1982.camel@lrz.de>
Date: Fri, 26 Jul 2024 15:00:04 -0300
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Steinbei=C3=9Fer, Sebastian	<Sebastian.Steinbeisser@lrz.de> writes:

> Our technical rep. has opened a case in our name and promised to
> directly escalate it to the US engineering (we're based off Germany)
> and to keep us in the loop. I've made them aware of the discussion as
> well and suggested they should directly reply to the list.
> I haven't heard back jet.

Thanks for the updates!

> Due to being on a trip this week I'll only be able to test your patch
> next week.

No problem.

> As far as I understand a simple git apply patch on top of the 6.10 tag
> should suffice, right?

Yep.  If you need any help with that, please let me know.
