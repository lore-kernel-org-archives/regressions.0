Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209F138B
	for <regressions@lists.linux.dev>; Thu,  5 Sep 2024 06:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725516425; cv=none; b=d6jHQAIGboEJwpxezJE7a9Iy1hqEO8HvJq70OnJaTe/2/DMvl3GYOT4036g7Gcm+XNf1vLqDeyBRCPqj6PJt4ZIlroOPEd7Ra5HEDLjZU4BHq/7J965xIjhxgaTwzxjdXUZIXf8D0oUYpae+X9x3RxoE/yAf0pZH3msjjDK9oFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725516425; c=relaxed/simple;
	bh=5LG1d3avN5co6G6gzC32VQF9Lut496WAZe399A99cSk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b4Kntc/1kS+zhjcjYp/F4NceyETqMpEs1O+FMNbq/AQtzabC7Ed7Djv2e3VnnPyp3SRyB9WdNutlQFMWYRWs83avZVuouYg5+Q1G/Ig7gSpJ+aGSyHMZWggap9XKyyOo8i/ofeTH4K7OE4lXlaf7V6sJa4MPWeQNZgDgXAitZeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JgAGGe2l; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JgAGGe2l"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6bd6f2c9d52so2165006d6.3
        for <regressions@lists.linux.dev>; Wed, 04 Sep 2024 23:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725516423; x=1726121223; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5LG1d3avN5co6G6gzC32VQF9Lut496WAZe399A99cSk=;
        b=JgAGGe2lsl3UR5MqlCEA8u0oz9sispUE8u5heWyax65vjL6i84gQtuI7AQPy0CGaPf
         +CI95VAfqlinPOG9u6Xm0s4V669N4sIwj4zHYVEjpNYep6mz1uT0OwslB9SrTMt7DLtR
         TMHlPkO5w4yLsn7h1ziMsL1tgqaK/UAqa0J6pXrYtYt1hLHU0yPOGuu/v1r1ycNZ0r9z
         iDT1t80wSpVVKD9I9trvFbkS7pRM+e9eLqJmR6ieuzVYH9rSbBgYbRxHKbUTukByLW0g
         tWftou4Bj9At69967KEQzmXbTrY+Nq6YsvufrvFS4eD1yohZ3VGOhYFZvY+GJpa9ESZO
         vE2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725516423; x=1726121223;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5LG1d3avN5co6G6gzC32VQF9Lut496WAZe399A99cSk=;
        b=VEcQGhwIGGr1WNYINhq0kvNk+DEkvo6uT0im+J6BXqYKSVen38HEfLM1hojZs5+hjf
         ZhrSZ5FZjfoSpT02KK4rvuxiOf1YN3rj2sNIze9til6/EBZTuhSKkK1Bnvz79XWUv072
         cvsJloYqAWRe1jYxUvsnf1MlGw9yKWZjTe6I56Iee9oslpqpofTHqu2QC4ElBsQk1SZW
         dmGuh1AoavNAsZGyLaaZToNqOyo/HifMtaIwV0PfkwXDlWdHeV7tYihOoUIvS47JHVP1
         0h69ii+RcapjhqdCtnDtOjaoeSrh1E75pILLQzIAMdYTgGP4vCh5JYli0nbSYFxgEpfO
         YPrw==
X-Forwarded-Encrypted: i=1; AJvYcCXj03XvNTcDIwaliJJn+c6yB7lwOMfsM2arb1IE38kjaH5FL4BXuOwQT9Oxaz4OgunZGuE87YvUmmFH1Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/e5biKXMTdtA7RubmGM30P8zS6tBGFsroDmvsYMGYKeCw3PmW
	OqKr+Pux89eeumlBRaQbWx8H+z5yB4bykRmI3HCxIu7FObbvDHhvduADS2St4VFx25xsMc9I0hW
	ICESrEJUPGAKwo9NapNf6YatvB2AJRJLDoxECIwSPW+M=
X-Google-Smtp-Source: AGHT+IGB8ymXCte18l4OE7yiIbhXNCU7V0Ne5O+JMA0juqCKhfd8whLL2b7mgE/CSWSFgutJc0fE9TPCp01kmop852o=
X-Received: by 2002:a05:6214:5982:b0:6c5:12b9:d5ce with SMTP id
 6a1803df08f44-6c512b9d761mr74759286d6.4.1725516422860; Wed, 04 Sep 2024
 23:07:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CABXGCsNgx6gQCqBq-L2P15ydaN_66sM9CgGa9GQYNzQsaa6Dkg@mail.gmail.com>
 <CABXGCsNztS8MLteq5=fcddwuQ1TCzeOM8TdVtpJ3crK=sV5PTQ@mail.gmail.com>
 <CABXGCsMdxHJ-MLkS0pm51Sk8g0PTghsuZxmowvj5t44bVN4ndA@mail.gmail.com>
 <ffd2c40c-1c2e-4465-b26f-88d5e08a80d9@amd.com> <CABXGCsOoL5vD0+FRALFQFr3ZBpb2z5mpGKzAD5RHoW9_sb5yaQ@mail.gmail.com>
 <f68020a3-c413-482d-beb2-5432d98a1d3e@amd.com>
In-Reply-To: <f68020a3-c413-482d-beb2-5432d98a1d3e@amd.com>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Thu, 5 Sep 2024 11:06:52 +0500
Message-ID: <CABXGCsMSTsBFW=OirDszPFVOiNgyOBSh3qyzAw-Coi-McnicAQ@mail.gmail.com>
Subject: Re: 6.11/regression/bisected - after commit 1b04dcca4fb1, launching
 some RenPy games causes computer hang
To: Leo Li <sunpeng.li@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>, zaeem.mohamed@amd.com, 
	pekka.paalanen@collabora.com, "Wheeler, Daniel" <daniel.wheeler@amd.com>, 
	"Deucher, Alexander" <alexander.deucher@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>, 
	dri-devel <dri-devel@lists.freedesktop.org>, 
	Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 5, 2024 at 4:06=E2=80=AFAM Leo Li <sunpeng.li@amd.com> wrote:
>
> Can you delete ", new_cursor_state" on that line and try again? Seems to =
be a
> unused variable warning being elevated to an error.
>

Thanks, I applied both patches and can confirm that this solved the issue.
The first patch was definitely not enough.

Tested-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>

--=20
Best Regards,
Mike Gavrilov.
