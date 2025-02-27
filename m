Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A434F22DFB3
	for <regressions@lists.linux.dev>; Thu, 27 Feb 2025 13:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740664416; cv=none; b=loGxVAUZ6hZdyGVl27726mX2NJD2RfgCk8uMjgPh65f06rikKFWhs/qJICemXEfS4bwOXT25o7ZlBAtT3INnWIqdYuOWcNm6h8VvTGkmO6bbT80T4eq4XIXzzYSscWFVioKdWv+yiO2vJcymTqMTjIIOc2Dz/imqbBa459uyOnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740664416; c=relaxed/simple;
	bh=yu3I1sO/i0c9jmjryoQXFMF6uACIg8nN2pvKPs7EzGs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=okS7LdOCqxStpQYZHuxXNxXEgcsIwK+xIDlQbr9o8JA0JdALfA/osG+EZ+AyKr2+0OEdUOb6OvtxF/xUzzJqLTpVxTjaU8p1B9zPSvyBsL+L8keOp4HuNvEYHnSUzrmnB+0GsNxLc1q7+f9NaziIaRtLShz6yZpNPUYhub3+shY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu; spf=pass smtp.mailfrom=heusel.eu; dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b=1vYLbdFm; arc=none smtp.client-ip=212.227.17.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=heusel.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b="1vYLbdFm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heusel.eu;
	s=s1-ionos; t=1740664406; x=1741269206; i=christian@heusel.eu;
	bh=yu3I1sO/i0c9jmjryoQXFMF6uACIg8nN2pvKPs7EzGs=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=1vYLbdFmXK8xOPPWmogjSqNJ3WbFZw46MHLXRxSogaYzDroWcpOBo/cvyJYC5NKM
	 U3xNL5akrhN5ZwQbbgYO7I5DtLYMcyHrV9J7uI4juLdjhez41u04DZL71lb9wE+YO
	 FHekpatmEI+xRqmteZ9q0OyL1jqFvZAtYsWUDxtRxWfVpOGMH/PTKFftDmf9qAygN
	 z1DjWVFzfI6NsAi2nx4ai8v5WV5Zl020D1LPRPbDzqkK6B/cRsYqo/odsTJb2UfBV
	 k57im29qAmqs9tRmqQhpQjmpWIsd3rUv382ATDvZfHOo3C9vsby0MM9jjDI/GhanL
	 EGqKy3uhgcic45bbng==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from localhost ([141.70.80.5]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1M7KKA-1tvMHh2URg-004FeR; Thu, 27
 Feb 2025 14:40:05 +0100
Date: Thu, 27 Feb 2025 14:40:04 +0100
From: Christian Heusel <christian@heusel.eu>
To: Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sean Rhodes <sean@starlabs.systems>
Cc: linux-kernel@vger.kernel.org, regressions@lists.linux.dev, 
	stable@vger.kernel.org, qf <quintafeira@tutanota.com>
Subject: Re: [PATCH] Revert "drivers/card_reader/rtsx_usb: Restore interrupt
 based detection"
Message-ID: <0944ac33-c460-4d3b-9ec8-db70d11ee9c1@heusel.eu>
References: <20250224-revert-sdcard-patch-v1-1-d1a457fbb796@heusel.eu>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fagmpuwyw6jacfay"
Content-Disposition: inline
In-Reply-To: <20250224-revert-sdcard-patch-v1-1-d1a457fbb796@heusel.eu>
X-Provags-ID: V03:K1:UAoKiThL18eaMR16lOypH0tDL6v31SyTTnwORVvuURDpSv3GNWP
 CyFsrTNUAWbByqOo7I//b5NbcH9NlkrI+NTlJg7igchBazkXrtLBzM8zb7N7aynuHMHS4O4
 Sf8/vJ/yJh34LY8NxzZDflq3VLAx2lMVwpHuLx8gg1hsqGpNz4rp3CMxJX1sUWgXueenOMW
 hJj4LE/nFr6Gm22AT6p0Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:wVJdjxztBMI=;LI/gz/DjfAMNknudEhQRikCTvPL
 rXyG4fRFEGTjC58p56Zr1QDCyeDa3UncLzgoXMJZCFcgvxjbp0NLzBD3T6uFBhVLTnFKVrbOv
 vQ0jGHldTCaUnStSYkrV89hzQMRC9LPAcaSgjxx1VhtSSGvsb0Y8thSmmapZ35qtlBVB3YhRq
 G4VHhXoo9jWz2eGraHqu15eJh6NzVoxE6WQdczaeh6775oLorKX4ejxFRbaANPNXxnhX/lbKM
 3pnqyoJJOCmbHjPlKYoZr9bJxUrieYxPF+6l5RbDOBlujwXU5zVEcOrElUxfRjChC03hCj+Oy
 zZ5MmgV4JJ7QhUEG4ZTHCKh8TTuJhA5/b2movMxn7crDcUR5doqkOWEi5ZGLxmMjWVQBXp5E3
 7JGiUPRZKhWwryg0YRK0QKzv4QvgK8iuNeGWIjjrr5z0kC/xm1JqykMl3DIKKR9PxmVdEMS4f
 bCOrT2cRwJ2IUcnogfzkUs5FB2P9mPYoAcrsZcmOKdx1Uofhm/1ya4hE4tHycDdh/5LiIaD7k
 9BVkhpk1HQe7ds/AAXeFe1CBiFecTnqTeCv6o4vOrcTd4u6Ki2afNbIKh3XOCLgn46CVhZolO
 kcJ5J/nEv7UM2Wlqce3hU8gbWXC8yMw/N5iaTDiZxbITkWxA+y2HZnCgyjwBirA2c9SYDc+LQ
 kyFkiEQnKzaPEH91nO/wz0hOFT4CoFg7Qm4L7KwudYcbLpGYdsydcAKkbJqhf4DCq+8A7YhxZ
 w648LmBxEPlXYkvylNpfKxKnL0P1z+hTnb9t0OpMc7v9Ap+IcmuJGe2sc2mSS7H72QXg/37dy
 hDgn9iJQU/t2LICWjhCI+Wos7RJIBy3UuMwwpveb0TfOXmXk9SKK1d4rt9LuClupWUwaLULLW
 SlkVGlgcsCHwibVUoIFE+NTgcfmqnDq15j6N7RsCM9e+ncupI7f4Pe3lDdCJFCBGNguCunetk
 KW68vAxg5DRXWijNH9fJFQVY5/easKXme+p59pj8unQKb7WsWBhJiAw97o64j7O7iAMaIscJT
 bclHJ+VjZH/K4h89E9rYQ6en86TpWXaCiAykX/OkyWVskWbJyn7x3fOguqncB07JRqNTlSec5
 TyDW4ebk3PfAwJg/A0gsZjmq1G7jCY268vu1NKptG4Hs91uNfqaIAifZEmBI1Q151mazr6APA
 hs022Te0e4LMer+KRW3//XBQMePzkIx4lpUxTYuUgV1QxRzUURkpO0QDRAlW4JiAC1CcHSfwU
 6Hc4fuoWreX92/g3QJKmsySTQW7d6wrWr8Utzc16x25Y6gCxnWM+fPtH3KaFWNbiaun42dXXf
 By8U6H8OEMr5yu+zzK5Pi7GLOQloC1mgGOZknXWh8tJm3ZbSZ5XBAdBj+lz0B2j1gkbxkHbdM
 DnVGv2JOwh4le+DA==


--fagmpuwyw6jacfay
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] Revert "drivers/card_reader/rtsx_usb: Restore interrupt
 based detection"
MIME-Version: 1.0

On 25/02/24 09:32AM, Christian Heusel wrote:
> This reverts commit 235b630eda072d7e7b102ab346d6b8a2c028a772.
>=20
> This commit was found responsible for issues with SD card recognition,
> as users had to re-insert their cards in the readers and wait for a
> while. As for some people the SD card was involved in the boot process
> it also caused boot failures.
>=20
> Cc: stable@vger.kernel.org
> Link: https://bbs.archlinux.org/viewtopic.php?id=3D303321
> Fixes: 235b630eda07 ("drivers/card_reader/rtsx_usb: Restore interrupt bas=
ed detection")
> Reported-by: qf <quintafeira@tutanota.com>
> Closes: https://lore.kernel.org/all/1de87dfa-1e81-45b7-8dcb-ad86c21d5352@=
heusel.eu
> Signed-off-by: Christian Heusel <christian@heusel.eu>

Hey Arnd, hey greg,

could one of you pick this up? Sean said in the other thread that going
with the revert for now seems like the best option and that he'll
revisit this once he has time...

Cheers,
chris

--fagmpuwyw6jacfay
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEb3ea3iR6a4oPcswTwEfU8yi1JYUFAmfAazQACgkQwEfU8yi1
JYWglg/+OCt/KmHtOczd6opE+8TuRU/+flDmltOsMsoryY6v6s0fMeawT5ShG7bm
bLhIzQuYD/WIFvXbG9J7ss6fIez8MmvvyMA6SKKkdoSwZWcXFepoqak7yWQ08nDn
tsDYtHLpNpZMIb81fbrZznWtIeZCqM10pegOvZ0k3Q39V4E1O/+IrMfYRtb2ipOV
2qliIL+eAzuj6uq8W1JTOGmEmzBn81JNEocjZ1hLpv5NOd+cgQ4U18xQGzCJ/q7Y
vZUS/RKAG4874+RJJu/ecOO2NAD3j/tUb31Un3OqJ08x0FP+XWv2ZLXR7lnVWHJX
zWphOztxwRxl4Ay3fqFFUN2693YnJeXQwqURK2nk9k9APpKyUqq16mCEHbEjI+Eu
i+KlJ6vUz3k7EfFoLzZJjTXOymGqaT+0W1Co4S3c6Z0rxZnlL1uo/PMtZjLvyRts
rcVUA6msIZ4xy+oAP/9+FeI7QjhH1Au27ruUdhU8rxmLhqJq1+HxwAUFz2eUIt/r
aCg4tfSGZ3vKJkuKWo0VORFy0r4E7JG4tyyFOYruCKi6HYduHgf95alfA9l9LV8G
EE1D6SoYlRBwuwTMI6MtLJWxVkpvjWNPwtoedxVLgymv6LWHs7z70QoqNW+l19hG
SI7IDY8GHkD7K0nk1g6j7LzjxN8iwUVFzBAspmPpCQhMGyCf/cM=
=OZ9j
-----END PGP SIGNATURE-----

--fagmpuwyw6jacfay--
