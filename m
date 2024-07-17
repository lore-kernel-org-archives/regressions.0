Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658E812E48
	for <regressions@lists.linux.dev>; Wed, 17 Jul 2024 06:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721197736; cv=none; b=eYgmmrjUxQCXz9GedTQXxOO9m0G//k9LE1/bmQjrhc6jzYUUV1grIXiOK+KH30V5crflAVNtyl4aHaF1evMIdfalBtF4wFX3mW2xtKbtJQmSf0vb842auIcI+1hK6fQPC59ZWvNDBM8zBVM2ISj85l+FloRwfylMo34TYKvNlOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721197736; c=relaxed/simple;
	bh=RSkPTIXm0vgM5ibd/3x5KTHf6taTWqqsaoDXuJQEbag=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xb7x124jhvbsKjmJ9gfKx9U0hUznARNgA/8QvGqIfocqeluuURGth5cigGSsm9pks3sTk3hNa44BViDaAE54hTGTW0eOEBJb7XFFeo4o/niW34nGlp1MHX3AmmnJvooMlopsAYywILbbLRKXzi8ySlyaX5QULUQHgmMaetREEP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EGAsN86o; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EGAsN86o"
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-4f2fb3a52adso80479e0c.1
        for <regressions@lists.linux.dev>; Tue, 16 Jul 2024 23:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721197734; x=1721802534; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RSkPTIXm0vgM5ibd/3x5KTHf6taTWqqsaoDXuJQEbag=;
        b=EGAsN86o+lbJcToOf7HH13ljs1K8sdDbRppZYu/Xbmpo5V3gKn0QxZNrs93q+NFEMZ
         QPUZBU2ji1adn0zoij9qi7uplJWA+azNkg0nhEr1LdMatm2bcRs+lTKp3GbeAdMtfcS8
         w29oVNsgAlk9NhQjn7Siz094fUPhEBvHXPlSXwz2MaXYpCmhLPWvqv30MQmjJ1ta0Utf
         2adUpUYTOJPKUxRkoV4qtk2/bvmmi1H2dMvyePOVborhV/6skaVkBCP6MYcx9Q2oYE7o
         PkTz8NzaoTCkFDS2hqgxN9Z/uLLMKpD4fLVID9WCYQMG2AnQmyB793OvqvTCoQb5HkxC
         oPDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721197734; x=1721802534;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RSkPTIXm0vgM5ibd/3x5KTHf6taTWqqsaoDXuJQEbag=;
        b=Cw6SYqnn0y8rscf3BYX4B54SvtEHlGw1NEYvJXXrxdiLKQiJK+GwUM4rpruc6kg/t6
         d3+ukPcn6tFmU1kN/ywAoI+am2VP77l0oWElkXalvBZPiHXygufFT4VT/WnaHDZM+Rw3
         JiWtld4bqIeFhubFPgyG97FOjwGPWbeEkBNHfxcz0EVbKnZC2Dl6qmDwq+dCR6pYJz+b
         cyqF8dGVR4QljSWNG8lTSQMmKiqfChY1qRH7bwxTrOykKiZ0Dx822YGmVAiiM3dmD6yl
         bQkWViqUdp2L/8k+4Tl6b1feXMIngsHZmKiKLFuwQuBVg4ysFAAtjB2MgP+uMOql4I4w
         qwdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUb9xdhBYGZpC3jSFC8sw+AgFUQD9yNb7mDXefjpNcgkC8qEJvTRZQP9PSlN86jBTw5oYLsJ8BTLCgKOyTQc9j61yUpwdggRn2s7HI=
X-Gm-Message-State: AOJu0Yz2d2J57+zLpoJ5Q+2NG1tnS50LdGjvrd1gpoRD8WLMZNnKmItT
	0U/adUC0/xaa4eY8m0TAHzCVp13czduEBx9YjFqkVfuM8cHpIFX9JCTziRx8k4Zh4ezPAeUAamw
	6uXS/slAXlC3960m/BmlafEs4sYQ=
X-Google-Smtp-Source: AGHT+IH6emIdV2LByUbcOkl0hcCesewSNdqY3NUKroEri1dufWVwjzjuOcqKzkDUbKwvEDD+8AKPj3GMeNqMto1COhk=
X-Received: by 2002:a05:6102:c05:b0:48f:8cd0:831c with SMTP id
 ada2fe7eead31-4915970e4eemr532812137.1.1721197734211; Tue, 16 Jul 2024
 23:28:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CABXGCsNptxsQO=5=qi-JYiFX=rX8Ok5inK80Gn0qrUFWbtBGng@mail.gmail.com>
 <CADnq5_PDxJ8O1JUQ9RBYRFB9G1WZJos05ZAM4jUKuPBwPxjNkA@mail.gmail.com>
 <CABXGCsNN9LwHc2x2AAEH=5UNwpvkWkBqRYz3OP8MZ6Woy+HDXA@mail.gmail.com>
 <b6c440ca-e63e-429b-af41-5f27d4b8b2a2@leemhuis.info> <CABXGCsNoFfMn7LaqqFgEPg-ECyUPN=f=SXVrFi=GZk6c69-Gqw@mail.gmail.com>
 <CADnq5_PDSkr4hOHJmb1J30UC0a7sXsm5-TPkEmjzffMK_A+7ug@mail.gmail.com>
 <ea465a40-f673-42b1-8b1c-a2efb20cd562@amd.com> <CABXGCsPyrUEqDq2gbr4VLw5ncd9cKoCZ9nOr2SRfg8Lh=9H5Kg@mail.gmail.com>
 <2915a8c4-ebac-4dae-8f09-32a5b4d9aeda@amd.com> <CABXGCsPuRViSd_WeOciLKcQ4hjYxJ7e3i7LomwsUMzd0a+zvBw@mail.gmail.com>
 <CABXGCsOsfP2SToiDhRAS51nPJ+Qr2v7B3Kjr+yVeP4G7zFZpMA@mail.gmail.com> <CADnq5_Mjxna+aqhWT49YLmXGH+piittc4FUSyCDEJ8s7G-Rb3Q@mail.gmail.com>
In-Reply-To: <CADnq5_Mjxna+aqhWT49YLmXGH+piittc4FUSyCDEJ8s7G-Rb3Q@mail.gmail.com>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Wed, 17 Jul 2024 11:28:43 +0500
Message-ID: <CABXGCsNS0a2tybuONAJuGoC1+01=RFhwSzfU6HW_ZLau+jAhHA@mail.gmail.com>
Subject: Re: 6.10/bisected/regression - commits bc87d666c05 and 6d4279cb99ac
 cause appearing green flashing bar on top of screen on Radeon 6900XT and 120Hz
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>, "Mahfooz, Hamza" <Hamza.Mahfooz@amd.com>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, 
	"Deucher, Alexander" <alexander.deucher@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>, 
	dri-devel <dri-devel@lists.freedesktop.org>, 
	Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 16, 2024 at 10:10=E2=80=AFPM Alex Deucher <alexdeucher@gmail.co=
m> wrote:
>
> Does the attached partial revert fix it?
>
> Alex
>

Yes, thanks.

Tested-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>

--=20
Best Regards,
Mike Gavrilov.
