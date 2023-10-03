Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E593D996
	for <regressions@lists.linux.dev>; Tue,  3 Oct 2023 23:56:22 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1c61bde0b4bso12963395ad.3
        for <regressions@lists.linux.dev>; Tue, 03 Oct 2023 16:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696377381; x=1696982181; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZCCBj410ajq0re8t8s28xHlISeDJPhGS19VANz63K9o=;
        b=fErces9pr52M6WD7V8gLVBIhfrSFGby5LGFYw2icfP/S19LMh6+vWlfN2xPJAX0WzW
         VsmL6vJW/uj3HowDI/AcNhjtp4ksKVIKPamqjVAW7w7YtUigzLqYpmAFTp2e4VXfqnfJ
         vLCZAuEKmL4s+6cJfFavv59XzpxOa8Za+zwBr+nPTel9vpKSZCdTDIuoJUJBLlbFzyZo
         Fj7eKOVSQmzzsmkI6zJ1ZVmBcLiYsHmw8Ws6mE5+do9y8d1jF1Aot+aDMdd/Gg631F1b
         VFNoyJKxWh5LMSQlasGewrLRq/FU5lQRqVPRC00havhSEGswUs46WwUNt62X6Mvbw5c0
         OXlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696377381; x=1696982181;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZCCBj410ajq0re8t8s28xHlISeDJPhGS19VANz63K9o=;
        b=iID586kTabcpalRg6pO5Zsf6JfhxHWIfyF6qqO+oUElfaaUq7tu06dwe4+nI4rg3ur
         eSnayEWeln2669rAR0e/Hv1fcSejI/DuLV9AyKG3+i3jJuoYnLp3sJ8K4EBJ9xxMLGPd
         fsAzV0VQAcZrJirZQT3whB2Rzj7Mxah64VX3gzlF1kC5YRtBJgGwosLJ1p6Xy4YAOCnt
         Py7n1r6j6qPjt7AirAFKEf5Df47TJMzvFhA4/yPiq3s0ZaK9VHquqXjKaJVKJ8hFGWgn
         m99X3eqolGIsyKYCEr8UD5twEKRJIxGyFckHVuGUgOAUfAgQpVF4h3xmDCu7QcRWrU6b
         dVsg==
X-Gm-Message-State: AOJu0Yy06FPTX5ATWzD0b1D3GYJc7baMkW/A15o8Eh/l4jaUbKADkrKE
	MHCHyvmQPfzd2CYxAv2xWWA=
X-Google-Smtp-Source: AGHT+IEQ/w1Y8P4IJ6FMYu9I9SDAvd9lq2qE+CakE2eHWL6oVHapQH7nJH+ONsuq9pi4d0n04dR+CQ==
X-Received: by 2002:a17:902:9885:b0:1c6:117b:7086 with SMTP id s5-20020a170902988500b001c6117b7086mr935395plp.5.1696377381492;
        Tue, 03 Oct 2023 16:56:21 -0700 (PDT)
Received: from debian.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id m1-20020a170902db0100b001b8b45b177esm2179485plx.274.2023.10.03.16.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 16:56:20 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id A41D781A7EC5; Wed,  4 Oct 2023 06:56:18 +0700 (WIB)
Date: Wed, 4 Oct 2023 06:56:18 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: "Kirill A. Shutemov" <kirill@shutemov.name>,
	Hilda Wu <hildawu@realtek.com>
Cc: Alex Lu <alex_lu@realsil.com.cn>,
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
	Max Chou <max.chou@realtek.com>,
	Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>,
	Juerg Haefliger <juerg.haefliger@canonical.com>,
	Linux Bluetooth <linux-bluetooth@vger.kernel.org>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	Linux Regressions <regressions@lists.linux.dev>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: Regression: devcoredump patch broke Realtek usb bluetooth adapter
Message-ID: <ZRyqIn0_qqEFBPdy@debian.me>
References: <20231003182038.k57nirtt4sonvt7c@box.shutemov.name>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lOp0O5Hmv9c8nMC0"
Content-Disposition: inline
In-Reply-To: <20231003182038.k57nirtt4sonvt7c@box.shutemov.name>


--lOp0O5Hmv9c8nMC0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 03, 2023 at 09:20:38PM +0300, Kirill A. Shutemov wrote:
> Hi,
>=20
> Commit 044014ce85a1 ("Bluetooth: btrtl: Add Realtek devcoredump support")
> broke Realtek-based ASUS USB-BT500, ID 0b05:190e.
>=20
> Devices failed to connect. hciconfig showed a controller with all-zero BD
> address.

What is its output then? And dmesg log?

>=20
> I reverted the commit as well as bd003fb338af that depends on the commit.
> It made the problem go away.
>=20
> I know virtually nothing about bluetooth. Let me know what info you need
> to debug the issue.
>=20

Hilda, it looks like this regression is caused by a commit of yours. Would
you like to take a look on it?

Regardless, thanks for the regression report. I'm adding it to regzbot:

#regzbot ^introduced: 044014ce85a17c

--=20
An old man doll... just what I always wanted! - Clara

--lOp0O5Hmv9c8nMC0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZRyqGwAKCRD2uYlJVVFO
o6UyAP9Slr9mZ+rRmtvUXh8WNdiIJEL1pcR6Ja0Bt3M/3Qr4qgEAnebbqTZM6ny7
9ZiB/gqtVQo7ARGVnp9hOJXS5BHafQQ=
=IV+/
-----END PGP SIGNATURE-----

--lOp0O5Hmv9c8nMC0--
