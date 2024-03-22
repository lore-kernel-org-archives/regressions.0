Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CEF7AE59
	for <regressions@lists.linux.dev>; Fri, 22 Mar 2024 19:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711136060; cv=none; b=TYmZkgJ9X5fCzBBh5sBqBNV4mw8rsJGiE2RD3KQR7Gbw0sD8tlY6ReWx0KL9GiJB7ebIJDvHfED/qYShKcxsvRdumaszc/zc8icRuvVTAXp60m4wsGa916841d1NpjY4A0Y58GG6fGU7ZXXwjZnqaGGtYSqkxivVN3taTYpUc1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711136060; c=relaxed/simple;
	bh=rmSxOJ7PesryFAlCYmpPV9lPM91ZLNWCXgJKf7O7vEw=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=q9tAUFkEHPeTvgwqfv68sIrukPv51qpeWqgUG5sttoWO/mAIotkXFV0DLi208SNjBtWBePW2elNsg+2VA8p5lSPr+j25LSj/sNRabcKa6a3cjXhsQajuyW1ab9+VxeQIW/MkN32OxWrT4WeFaSfQJaXZeGHmNAPYODJt6cw9PbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=craftyguy.net; spf=pass smtp.mailfrom=craftyguy.net; dkim=pass (2048-bit key) header.d=craftyguy.net header.i=@craftyguy.net header.b=Kj1QB2Ki; arc=none smtp.client-ip=91.218.175.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=craftyguy.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=craftyguy.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=craftyguy.net header.i=@craftyguy.net header.b="Kj1QB2Ki"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=craftyguy.net;
	s=key1; t=1711136055;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rmSxOJ7PesryFAlCYmpPV9lPM91ZLNWCXgJKf7O7vEw=;
	b=Kj1QB2Ki6DZ6KhgM77hUzPva/yi9CQDjDrOeQcS8zioPvZN9//CpoNvsSLuS1VUy4Vm+k9
	mIAnA0OHemCkGxjj75TnqezkmBWoyYOw+xtVpoDNDBNsUfpK4yQQyTwZ7uIOYoLHC/6QW2
	ZLVCr4yfVkn94nTHfTQYamuWuC84m0a8md9x4dfaVp1V7Zk+TpyKxc0zJvpdZEgn/ceps2
	qpDj1YAamo819kmdnvIl88Z20VBQoF8OVZsxASapbyuF3avfj7R66qnayIORrTqbxfaT3Z
	B6f+PpzazTzdg/EoFu+pE8XBgzKf68olAEY9Sl5gaSOkzESJ6i6Fzcw3CeDmVA==
Date: Fri, 22 Mar 2024 19:34:12 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Clayton Craft" <clayton@craftyguy.net>
Message-ID: <8a64ba697d719bc9750e6fffc268e194dfde16e5@craftyguy.net>
TLS-Required: No
Subject: Re: x86_64 32-bit EFI mixed mode boot broken
To: "Ard Biesheuvel" <ardb@kernel.org>
Cc: "Hans de Goede" <hdegoede@redhat.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-efi@vger.kernel.org, "Thomas
 Gleixner" <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>, "Dave Hansen"
 <dave.hansen@linux.intel.com>, regressions@lists.linux.dev
In-Reply-To: <CAMj1kXEH4CTnQ3d+Z-TnqNUhFaFc1yH+Eaa6cHk9-vZ_geQ2nw@mail.gmail.com>
References: <20240321150510.GI8211@craftyguy.net>
 <CAMj1kXGzH4TiwvSF3bZsJpuuWf04Ri_852fUMTdH8pLRaH3+Yg@mail.gmail.com>
 <20240321170641.GK8211@craftyguy.net>
 <CAMj1kXE-sxGM2H8akunJ1mZPDSVX1+2ehDtK-jqW--8tw9J5LA@mail.gmail.com>
 <20240322091857.GM8211@craftyguy.net>
 <CAMj1kXFmnv+FGRMnnJMJejj5yvSybgZTNEYZz0hxb6K9VAeo1Q@mail.gmail.com>
 <fe09869c2d853bde8ce0feb537c4dab09014f5d9@craftyguy.net>
 <CAMj1kXEH4CTnQ3d+Z-TnqNUhFaFc1yH+Eaa6cHk9-vZ_geQ2nw@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT

March 22, 2024 at 11:30 AM, "Ard Biesheuvel" <ardb@kernel.org> wrote:


>=20
>=20On Fri, 22 Mar 2024 at 19:57, Clayton Craft <clayton@craftyguy.net> w=
rote:
>=20
>=20I have pushed a branch below that reverts the patch you identified in
>=20
>=204 separate steps. Could you please check which step makes your system
>=20
>=20boot again?
>=20
>=20https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/log/?h=
=3Defi-clayton
>

Thanks a lot for doing this, I really appreciate the help!

It looks like if I build from 868a7245, booting breaks again on my Bay Tr=
ail systems. If I put back 00e85ab5, they boot again.

-Clayton
