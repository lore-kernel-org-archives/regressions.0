Received: from mail-4321.protonmail.ch (mail-4321.protonmail.ch [185.70.43.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED45EAD5
	for <regressions@lists.linux.dev>; Thu, 29 Aug 2024 05:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724910143; cv=none; b=VXvX/HnfmaR4ZURH4GdzdMFCPirqDEhhJK1JVBEcITBTNB1lxDXMteFdkNKXETRv8bmuz22bHa9lvR4U5l24jzuHZ/5TJpwys/cucbICR0s37ZmycwhFuRWVHcatXu/FkVFNJHYbXS4iFG/zCZh6k9wOJ216L5J6sMEcL5sUSyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724910143; c=relaxed/simple;
	bh=e21W/usF6gaD9SQSsXsIv7HHbzOvHTu7frrvrrCJokc=;
	h=Date:To:From:Subject:Message-ID:MIME-Version:Content-Type; b=F2/C+tHHBGEwd1G4OYINcP4xhM8TCcOSAUJ/wRXOppmXOaumadyxNf31kOjX2kqsTb2ZLTrtiylsWjoO5jul6boL2DehzCRDdrNbk2cL7sZP9hhyJR3av2/CyRp4rjMqaELQ6sBp0wA0rCH39szhZj5IoF1dzsVDOCFLY+/lRBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=DYppk5f0; arc=none smtp.client-ip=185.70.43.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="DYppk5f0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1724909640; x=1725168840;
	bh=e21W/usF6gaD9SQSsXsIv7HHbzOvHTu7frrvrrCJokc=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=DYppk5f08YSwe9y2wfn1eLl3bkz14HrJD2ihIZzYs/26dSGhB+IkS9CIbxM4WbfBt
	 Q7jpHxPBrjIXUlK5ew/Xcq8qXhE2tNfAXXLXOJL8tSVrfNXu0X8ysOTwYo0dLkIaGY
	 p5kLGgtmCZSCSgtu1wcp7sGfRX36lQhQeW354BrC84omyYCaLhGY+n8snVJBbAhTbJ
	 898qIkIr/HsKcoiLem3gQK7tRTkwLccI6KTf1Y9agHA9msCQ/8rEy/zAjZk01a9k/s
	 1mFOmhnvkk8Rc/DYZ7Anpm0Xp4aIdhPi10pix+uXwyoxAjE8IcKWgiYDCGHryjciGk
	 JJrRzHqRU9RwQ==
Date: Thu, 29 Aug 2024 05:33:43 +0000
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
From: denalimoose <denalimoose@proton.me>
Subject: [REGRESSION] console scrollback
Message-ID: <LAnGXs-kzVpOpp-r_RfFvWOeG6OGCf5zILdCmBVOBg9J-nJnRPLWKRxzusRGjj3C3Z7r5Tt1udZCQYtE6F9bkjYnY02LmV_pEabm4valGJo=@proton.me>
Feedback-ID: 101141598:user:proton
X-Pm-Message-ID: 46955c5c3d1e41acd569c65ec5ca1a15130a84ae
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

2 patches were made in 2020 that have unknowingly been causing many people =
some headaches.

fbcon: remove soft scrollback code
commit 50145474f6ef4a9c19205b173da6264a644c7489
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3D50145474f6ef4a9c19205b173da6264a644c7489

vgacon: remove software scrollback support
commit 973c096f6a85e5b5f2a295126ba6928d9a6afd45
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3D973c096f6a85e5b5f2a295126ba6928d9a6afd45

I'm sorry, I'm not a developer and I don't know how to properly report this=
. But our team (that works with consoles all day, everyday) have been wonde=
ring why scrollback has been broken for years. We only recently became awar=
e that it was removed on purpose.

No, piping to less or something else is not a replacement for what was ther=
e and working great for a long time.

The reasons cited in these patches are narrow, shortsighted and not at all =
inclusive of people that work with consoles.

Please rollback these 2 changes as soon as possible so we can bring back ou=
r productivity and sanity.
