Received: from mail.theune.cc (mail.theune.cc [212.122.41.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D17B1DA5E
	for <regressions@lists.linux.dev>; Wed, 11 Sep 2024 07:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.122.41.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726040375; cv=none; b=sTQsYzOdG6Li48e9HCL0mm/7PiqvmOb4m9RbweZAb/ElK6z90CZWI9JiZ3ndagtUXCu9aNKIJlbITeXxAZK2aEriOEJuQFgMH5GU23ll6mOFo8UsjVAbk4lKzAY692KUNda+D2NR4VQF3uSwf7tVyGa7oxhEXlLV6Od3hwU8/mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726040375; c=relaxed/simple;
	bh=XEbNjJM9eSTfS1MMUJ9+jbUpQ3vdaHQaKr6cGtfzsV0=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=tAYiZ/DogHHQf3Fta5cNQyI19VW88WxT0kgpoqF7Zt0Q5+r+7Tsyf1Tf6N5wsdWTTDUFVm2SazIG7RWqNeZgiWeKUz8/mCcz57LlPv8o1m0R7fXMe1yXMv9tNYSPnMhlsU8BJWhYZSSVhcYdlbWNI1rgH6oMMr4GCNJWbi12v0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=theune.cc; spf=pass smtp.mailfrom=theune.cc; dkim=pass (1024-bit key) header.d=theune.cc header.i=@theune.cc header.b=5Ki3W3/g; arc=none smtp.client-ip=212.122.41.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=theune.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=theune.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=theune.cc header.i=@theune.cc header.b="5Ki3W3/g"
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theune.cc; s=mail;
	t=1726040362; bh=XEbNjJM9eSTfS1MMUJ9+jbUpQ3vdaHQaKr6cGtfzsV0=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To;
	b=5Ki3W3/gZsG/UfxvBauC0hCeWpgRETafZDsYcghwc2NqBmoMQOAa5DsAZ8O3mv4IM
	 W3TXfMU99qyr4K21PJ5JiuGWwhFnFJC2gbhiDtu9aaku9Z9hB4LG0jvOnjYA4w4vnL
	 kSHH476xzAoVEm1ss9cwwPZ4tIgPJ71qitb1lrg8=
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51\))
Subject: Re: Follow-up to "net: drop bad gso csum_start and offset in
 virtio_net_hdr" - backport for 5.15 needed
From: Christian Theune <christian@theune.cc>
In-Reply-To: <8348AEDD-236F-49E3-B2E3-FFD81F757DD9@theune.cc>
Date: Wed, 11 Sep 2024 09:39:01 +0200
Cc: Greg KH <gregkh@linuxfoundation.org>,
 Willem de Bruijn <willemb@google.com>,
 regressions@lists.linux.dev,
 stable@vger.kernel.org,
 netdev@vger.kernel.org,
 mathieu.tortuyaux@gmail.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <AD8BDB95-0B4A-435F-9813-5727305CA515@theune.cc>
References: <89503333-86C5-4E1E-8CD8-3B882864334A@theune.cc>
 <2024090309-affair-smitten-1e62@gregkh>
 <CA+FuTSdqnNq1sPMOUZAtH+zZy+Fx-z3pL-DUBcVbhc0DZmRWGQ@mail.gmail.com>
 <2024090952-grope-carol-537b@gregkh>
 <66df3fb5a228e_3d03029498@willemb.c.googlers.com.notmuch>
 <0B75F6BF-0E0E-4BCC-8557-95A5D8D80038@theune.cc>
 <66df5b684b1ea_7296f29460@willemb.c.googlers.com.notmuch>
 <8348AEDD-236F-49E3-B2E3-FFD81F757DD9@theune.cc>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>

Hi,

I just took 5.15.166 + the 4 patches by Willem as they=E2=80=99re =
currently in the queue. The applied cleanly (which you already tested) =
and I can demonstrate the known error (bad gso: type: 4, size: 1428) on =
5.15.166 without the patches and it=E2=80=99s gone on 5.15.166 with the =
patches.

Thanks everyone!

Hugs,
Christian

> On 10. Sep 2024, at 08:32, Christian Theune <christian@theune.cc> =
wrote:
>=20
> Happy to do that. I=E2=80=99ve blocked time tomorrow morning.
>=20
>> On 9. Sep 2024, at 22:32, Willem de Bruijn =
<willemdebruijn.kernel@gmail.com> wrote:
>>=20
>> Christian Theune wrote:
>>> I can contribute live testing and can quickly reproduce the issue.
>>>=20
>>> If anything is there that should be tested for apart from verifying =
the fix, I=E2=80=99d be happy to try.
>>=20
>> If you perform the repro steps and verify that this solves the issue,
>> that would be helpful, thanks.
>=20
>=20
> Liebe Gr=C3=BC=C3=9Fe,
> Christian
>=20
> -- =20
> Christian Theune - A97C62CE - 0179 7808366
> @theuni - christian@theune.cc
>=20

Liebe Gr=C3=BC=C3=9Fe,
Christian

-- =20
Christian Theune - A97C62CE - 0179 7808366
@theuni - christian@theune.cc

