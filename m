Received: from mail-200161.simplelogin.co (mail-200161.simplelogin.co [176.119.200.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A76961B86D2
	for <regressions@lists.linux.dev>; Thu, 18 Jul 2024 20:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=176.119.200.161
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721335441; cv=pass; b=lCuew0h8q8HehNVbC3XRZozT7pk9ycdcKC+XmVJBBSslrEiUkmtJjS4+6mWfQwmiB3elVj39pdwFBEs2UgAe0PhA5A6T7ac2g9DddV3OAfvbq7F8KPG9w9m8gBeEBt8XknTI+IR774/K8JKpYnHaw3sBxy8IBL/e1NTeY6GxXbI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721335441; c=relaxed/simple;
	bh=TUhi+CeX6Fxm6rH7ijVkPjTdOJiUxQkOroUN2Wfh10k=;
	h=Date:Subject:In-Reply-To:MIME-Version:Content-Type:From:To:Cc:
	 Message-ID:References; b=kDAzGTAZ1vsMFVTa6BZEUtpvHt66j7TKB12nVezLk0eNx4GH9N9VC1J5uW3D6T6v79Q+4ZHF2Yb+yfSqyvso1EvE1Zoq0xMwqMI+pL2NOqFezHt4WiKJEOf97hkcdAPWbw4ccRRFPfYQVOzVS/lQqmgTwyifHsY4sDGX+qcoxV8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=simplelogin.com; spf=pass smtp.mailfrom=simplelogin.com; dkim=pass (1024-bit key) header.d=simplelogin.com header.i=@simplelogin.com header.b=ErFfCIwV; arc=pass smtp.client-ip=176.119.200.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=simplelogin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=simplelogin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=simplelogin.com header.i=@simplelogin.com header.b="ErFfCIwV"
ARC-Seal: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626; t=1721334513;
	cv=none; b=APU/mXAEsYQoM3dGn6KEQ8AStPc2aQvHP8+3ldFbceo8RqWKQyS82Xr5SE5kfumqa6cul9YOahUkq0ynl4V3eNsXRKlGgyNa+Rq4y6+lvL1tYo2ror96Pj52UQoYgB8kctqLHeoqohjNU/1jYFzyTZ6c/rpq5x0I2Pk3DU4dt/GoVuhJKMrFsR99ChaMZGVUuhPmSjjBTXIepLrFPb63Zc511cs+N2RvqRhb2rln3KsG0MtaOUBzXzHsmangnCfvkHa52Dx3yVq5Zkv+8W/244bU8tc9ETE5BvNb1FIUKMQ7//+gMgcuByX7Pz5LamwSzHgYZruK256iSfsPU/KwYA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626;
	t=1721334513; c=relaxed/simple;
	bh=TUhi+CeX6Fxm6rH7ijVkPjTdOJiUxQkOroUN2Wfh10k=;
	h=Date:Subject:In-Reply-To:From:To:Cc:References; b=KVVFfcVXYQkIKdBet9LR8LhuIAxBkKHjMmktSZBkPBT/m2WVoZVKcJq7dAasrqMFrvW4nCQJYFFfuqZVH8xxUlHOmaN/WiWkRAou7pHmKuVv5nSEh3/zU6d22l+DDVt1k56XG8jd3WETszQ9gfWZWQ31AGy/VHz/Z6Zg7LWcaSWB8gFEwRRVLcnROdJGs7s+oqBTQ6/m6DTgfC6Vl2xNBbefDUwmUzDGUYuJ6xU2mHtgV5wrRQNQgpw/m0Y44lAeQpGvi+e5XFQwVUvSMfQP51wUCL+Ee7LRPPhK3kmyQMqOiVpxOGy9FlVosDa+NnO2NsIry2ISvB3A+slfMH76ZA==
ARC-Authentication-Results: i=1; mail.protonmail.ch
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=simplelogin.com;
	s=dkim; t=1721334513;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TUhi+CeX6Fxm6rH7ijVkPjTdOJiUxQkOroUN2Wfh10k=;
	b=ErFfCIwVzkyqcmr7zsFEmZt8lVuPgowUQlkDy6QXB8NFuP/+LSAc/wJFcOR0bx5GRLi/YJ
	uVfGUmrCV9624ItUqI4AzZJbN/tRTfw2FEwaS1UADSQFZzVt2gLP4TaHrrqrab02p2aamt
	aWSBaSRIY8YVWGwtS/57aT/Po8k+BWE=
Date: Thu, 18 Jul 2024 20:28:27 +0000
Subject: Re: [REGRESSION] linux 6.6.18 and later fails to boot with "initramfs
 unpacking failed: invalid magic at start of compressed archive"
In-Reply-To: 
 <CAMj1kXGYicoxQGsv=3uM2bgs99aXxPMFUwib5bTVa6U6OSxzUg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: mavrix#kernel@simplelogin.com
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Radek Podgorny
 <radek@podgorny.cz>,regressions@lists.linux.dev,regressions@leemhuis.info,Christian
 Heusel <christian@heusel.eu>
Message-ID: <172133451315.7.8041341910867954609.383315718@simplelogin.com>
References: <172096653882.8.16813493378478071178.379356753@simplelogin.com>
 <CAMj1kXG9AjvChj9O6LR+2bFVUoa225phaXndYvQ_f4X4bKioaw@mail.gmail.com>
 <172125357072.7.13007674265724826216.382402450@simplelogin.com>
 <CAMj1kXGYicoxQGsv=3uM2bgs99aXxPMFUwib5bTVa6U6OSxzUg@mail.gmail.com>
X-SimpleLogin-Type: Reply
X-SimpleLogin-EmailLog-ID: 383315718
X-SimpleLogin-Want-Signing: yes

On 7/18/24 12:15 AM, Ard Biesheuvel - ardb at kernel.org wrote:
> Thanks for testing.
>
> Please try the partial reverts in the following message
>
> https://lore.kernel.org/all/a99a831a-8ad5-4cb0-bff9-be637311f771@podgorny=
.cz/T/#mc9943f4fc27c2f4637d697a4d23e37d2c334d076
>
> and determine which of the two returns your system to a working state.
>
6.10 mainline with 3-0001-Partial-revert-of-8117961d98f-1.patch works.=20
The other one doesn't.



