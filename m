Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED2620EA
	for <regressions@lists.linux.dev>; Mon, 29 May 2023 08:24:39 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1b039168ba0so9941765ad.3
        for <regressions@lists.linux.dev>; Mon, 29 May 2023 01:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685348679; x=1687940679;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nvt0GJ2QNY+rFYHNBGjXKBYm5GhXHIFHMKlgbX9PLZk=;
        b=R1NVU0pqq0Dlw2lqS4BrSYDie0cRmWwcq722khiiwhlJ1YNKNQ0F6ayuf6Jc25fxEV
         REWSG+z/8WPD1DjCSlsculfyM8tkigqWD5Xj/GJgTPI/phXg37BIF2Hi+yX75SRZLHfH
         iwMokATwsMXSgyps3tN4o2dssa+qY6qCZGwo8wmc+XSLWsrGV0IQmlfiDHLOZiP5RZ5v
         lumbspD7eBzCD6D9G/IHfgfBHPwHtZyw4gl8zf/PJJ+X1RDJd5jkrS6S2s4/C7YW0QX3
         gfLh/85bQ4+4Mj/MxQyGhAI3ac667ZIJMUpq4XfMCUES7qk5Ra1ZRe3TWU3wGHqBzDik
         qKZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685348679; x=1687940679;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nvt0GJ2QNY+rFYHNBGjXKBYm5GhXHIFHMKlgbX9PLZk=;
        b=F/bvV8OxD2tI12iSQ0MkTtrcId9NFOWyCw3X5tIk3vfb+45xRHmSWqZSMmntykYgjt
         r/pYVQq2G0w1emMjdvkwr8C3RzxIotEsmozyRk8KC7px1rH3KbDZzzGh2LaZVO4WMYM7
         0WZKp53ZWRO0TaALz06j37G0fS0BQ4p8IJDM9A8IHgyyaI4zMXLShNYcxqJGVOFjXjSl
         SB2OcSHvOmK46Og0NNIxAcaRt4fovCNGv+FXkZCE3GlmdQpfB+Zftnlz7VAxav0VS6FM
         MbxvXs7r24WByJ7x8wlOMwpmfjrSzx0ocgHLic6ikRb7vonaFxo/t2RMRwZILGIZcKyh
         dIgw==
X-Gm-Message-State: AC+VfDy0Z3RinLdTwvu4mR0TP2BTB3xHpXmEW+I5byqBaGnZt+J6LvAD
	H9AdUiho9/XF94uQvkiKdBs=
X-Google-Smtp-Source: ACHHUZ70mYW4u96RSo3Ry/YJBBDWbyHuvhnrjdHhLlQ0uGBtm0rqCM5LLQsGo//UKx+Iq7pYhSiRZg==
X-Received: by 2002:a17:902:a610:b0:1b0:4b65:79db with SMTP id u16-20020a170902a61000b001b04b6579dbmr475567plq.63.1685348678850;
        Mon, 29 May 2023 01:24:38 -0700 (PDT)
Received: from debian.me (subs02-180-214-232-78.three.co.id. [180.214.232.78])
        by smtp.gmail.com with ESMTPSA id jh19-20020a170903329300b001b012589c49sm5637750plb.78.2023.05.29.01.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 May 2023 01:24:38 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id BD8B6106A11; Mon, 29 May 2023 15:24:35 +0700 (WIB)
Date: Mon, 29 May 2023 15:24:35 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Doru Iorgulescu <doru.iorgulescu1@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux PowerPC <linuxppc-dev@lists.ozlabs.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Zi Yan <ziy@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Fabiano Rosas <farosas@linux.ibm.com>,
	Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
	Disha Goel <disgoel@linux.vnet.ibm.com>
Subject: Re: Fwd: ./include/linux/mmzone.h:1735:2: error: #error Allocator
 MAX_ORDER exceeds SECTION_SIZE (v6.4-rc3 build regression)
Message-ID: <ZHRhQ92aXQCQa_yK@debian.me>
References: <2a1cd5e6-01f7-66f9-1f9d-c655cc3f919b@gmail.com>
 <5d22e1e9-0307-3664-8b4a-99caaaaa4315@gmail.com>
 <87bki9ai11.fsf@mail.lhotse>
 <CA+39qUjP48n=EwqHzwdGkBE8SC-nTNZHZxEfG4r4hWC-5Bg4HA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="n0n99li26aKBWElc"
Content-Disposition: inline
In-Reply-To: <CA+39qUjP48n=EwqHzwdGkBE8SC-nTNZHZxEfG4r4hWC-5Bg4HA@mail.gmail.com>


--n0n99li26aKBWElc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 24, 2023 at 06:13:52PM +0300, Doru Iorgulescu wrote:
> Awesome, thanks!

tl;dr: see [1].

(Hey, looks like complimenting noise here.)

[1]: https://lore.kernel.org/regressions/5df92692-296e-3956-24fa-2bd4393379=
53@gmail.com/

--=20
An old man doll... just what I always wanted! - Clara

--n0n99li26aKBWElc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZHRhQwAKCRD2uYlJVVFO
o+jyAQDEMW9U8RtyW3eLmz1vfYY5zX7zMISeoeMx9Ep+ODtNAgD/XvY+dmTzM2sW
OCQZJxqHfzgzTV/+CFXMZ4UMTRIWagI=
=vA0l
-----END PGP SIGNATURE-----

--n0n99li26aKBWElc--
