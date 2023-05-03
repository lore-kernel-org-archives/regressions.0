Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DBFA7E9
	for <regressions@lists.linux.dev>; Wed,  3 May 2023 02:31:44 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-63d2ba63dddso3513373b3a.2
        for <regressions@lists.linux.dev>; Tue, 02 May 2023 19:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683081103; x=1685673103;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XQWXAejBoMjPdddOvsfd20voWlUxAHiXq27bsxhVrrA=;
        b=iF3f9ZTsPUroq+qz9RYT8xXZjd8aeG7ryhIjgpLEAvrmmQ5AIsRCyF4V3OqLESJ+0l
         E7bh5pml6MDtZAM71jqbmki2XHhaQ3gxgJgDdCT7ci54A7QFqCRxMX9pnaklC8zvid47
         VmQtQZ59Kf3mE+XdyAMJ6VmtEifgRc5SaBn82X05KVyKFx4wJzPqOngy4kSumzZYyB9F
         NuRm6E3eOj9gh/p9cadK9zYqj9o8YM0kk0MRY/f1zQAiw46RyoKYORtM+xH+QEEVDW2L
         YHw0t04Z6WsU1JGSPCtvEoiUbKL8NipTs0+bIzN2Jrz1TGzskW6DU5f9kcNXUOBhiX3M
         AHIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683081103; x=1685673103;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XQWXAejBoMjPdddOvsfd20voWlUxAHiXq27bsxhVrrA=;
        b=HzSXZq0AkDkbKSxHFPPgciIYwbtuqTc00qzPE+NdVRmQqdiA4W93TXeVybJMjRLwxc
         seVb1C80uDB6tFXR/2ic72GDCSO6YMigDDR4mZ6A5I9JdyHPTNq8VDbRmbITbVG7QhhY
         ZMXF/5eRbuhIXUWLo3QjLwyutypldvrkdg6BEyS8RtmPWhgPL5KXJW98LekskC7mZMN5
         1l3vGwJn16+ATeRzbJBTtfnJaiCorLxTPT8VwxgOS2StcKB8PurwvKa56Pk0C+GWtPEF
         FSKGXDWXjLpr6QDPGQXSFz8UmngQJKsBuJfTOnIJA65w7P7xRaYwTISQU+zbSUsIKyrP
         FUjg==
X-Gm-Message-State: AC+VfDxltonDWDj4dmwNli9dDzwpr5aqQr+wjREIQBrYMOVNZ9KmYOc8
	TsegAKzSDnTe/eN65muQNeA=
X-Google-Smtp-Source: ACHHUZ7qSQBTjPkDbG4CIDwko6r4i175+lLPZ2So71jv3P+SxPrT7TYzzl71wtPXzXExwCHljAlGMg==
X-Received: by 2002:a05:6a00:ac6:b0:62a:4503:53ba with SMTP id c6-20020a056a000ac600b0062a450353bamr28192123pfl.26.1683081103382;
        Tue, 02 May 2023 19:31:43 -0700 (PDT)
Received: from debian.me (subs03-180-214-233-11.three.co.id. [180.214.233.11])
        by smtp.gmail.com with ESMTPSA id ei23-20020a056a0080d700b006410f4f3ecdsm11165335pfb.83.2023.05.02.19.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 May 2023 19:31:42 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 094D2106248; Wed,  3 May 2023 09:31:36 +0700 (WIB)
Date: Wed, 3 May 2023 09:31:35 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Ben Greear <greearb@candelatech.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	"Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info>
Subject: Re: Hang loading initrd since last Friday.
Message-ID: <ZFHHh/m0pkOYIzo7@debian.me>
References: <9d87defc-5376-d690-b483-bc314e4f568b@candelatech.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+Hw2PTMtapHrPCLo"
Content-Disposition: inline
In-Reply-To: <9d87defc-5376-d690-b483-bc314e4f568b@candelatech.com>


--+Hw2PTMtapHrPCLo
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 02, 2023 at 02:03:33PM -0700, Ben Greear wrote:
> Hello,
>=20
> Pulling today's upstream 6.3+ tree, my system now hangs loading initrd.  =
Nothing useful is seen on
> serial console after that.  This was working late last week.  Other older=
 kernels boot OK, so
> I think is is related to the kernel.

What is your setup (especially kernel config)?

Is v6.3 works for you? I haven't seen this regression on my computer
using v6.3.

>=20
> I have not yet started bisect, curious if this is already know problem.

Certainly you should try bisection.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--+Hw2PTMtapHrPCLo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZFHHfgAKCRD2uYlJVVFO
o+M9AP9ddVhJGRpf3Znz9l+FuRJ8N5un3nnRad9n2QUGHacIBAD/SYGQRpZCTu4w
xPp/awk6QFqYfEH8a+PtgQ+80s2S2wg=
=mmUT
-----END PGP SIGNATURE-----

--+Hw2PTMtapHrPCLo--
