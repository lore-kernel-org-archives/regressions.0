Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30EB5EC0
	for <regressions@lists.linux.dev>; Sat, 16 Sep 2023 09:21:00 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1c3d8fb23d9so24627275ad.0
        for <regressions@lists.linux.dev>; Sat, 16 Sep 2023 02:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694856060; x=1695460860; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7zuTibSi5ztqLkF1vd+JRrLaHMboda/KQokFx/uMf4w=;
        b=d+CfWGqiuhK9eW+3ITAEJOP0WILOChnc9LsYDABWLo5Te1Gqrt5hivCyDQEZi/2fro
         ZZlqfsl5laDLVxMxtBv7Fp4cmTYV4G8M/o7Y5tk9nZOskRqbOHnnB9zFtSAk4JdCKosa
         3KyhuIyYGMEb1nJ7RtQ0h5cWdmxhiqqz59hgkCxKQtUqspmjrVbtttSXWHgqj7qzK3ph
         El9U5YhcG/GlFoFOygiFAfa2UxGWv0z6SXbUUjcdkMVdGgCWNEOCqw6M27XwXpkBi6nW
         HB/bIdxbESpUNh/xKIdAvviDleLDOLlhFX3RwJjWxEnyXTE2OSqEspk7TYZgZP2vVYyB
         CSZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694856060; x=1695460860;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7zuTibSi5ztqLkF1vd+JRrLaHMboda/KQokFx/uMf4w=;
        b=EtoFBIQcjUbDDGGkRbnye26M8CKalKliv6H+3voaA5v30DBLZ7MfoeFAXNARTWByiN
         5/N50xfgOsRQceXvC9KmpAjtV44dUCG8OMZXyu27hQo3TYNceIHLgHGAQ0zs6cY+qPSH
         hnf4I25FBdHHe3QeiHj/YfFgnoxThk5HE3HtbTTXvufHXEJpMV7HlFTx2VszOmDN08tz
         XwcloLkzYEyQ3eZWeFFBUVS66gO6qyhu2LxzUjPz1XN8VI0u87Fl8nO8XHC56ChFMk4Y
         BjlTpfPaabZCVMgAtooU2pLNkGxbz8drf4Xv52PGUaOk9wFNGWEj3HLpUo7Ij5Oh/igr
         Imuw==
X-Gm-Message-State: AOJu0YygYoMmwuX1Ojv3jasKvGU1w4LIeSl8+rLQtPHRpoNgcxuPBn5+
	a7DSVXXRLA4M/5tLG4zTc7g=
X-Google-Smtp-Source: AGHT+IGrdLmfvjyu0Ob91jh/3XFzEkr/KD9Ap8V4K1Y9OA/jwEQBy7Yq3TWxR+hYBECpFG07C6gTFQ==
X-Received: by 2002:a17:902:cecf:b0:1c3:308b:ecb9 with SMTP id d15-20020a170902cecf00b001c3308becb9mr3698501plg.11.1694856060264;
        Sat, 16 Sep 2023 02:21:00 -0700 (PDT)
Received: from debian.me ([103.124.138.83])
        by smtp.gmail.com with ESMTPSA id f18-20020a170902ce9200b001bbbc655ca1sm4819216plg.219.2023.09.16.02.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Sep 2023 02:20:59 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 97D7182F4CC4; Sat, 16 Sep 2023 16:20:55 +0700 (WIB)
Date: Sat, 16 Sep 2023 16:20:54 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: "Doug Smythies" <dsmythies@telus.net>,
	"'Ahmad Khalifa'" <ahmad@khalifa.ws>,
	"'Guenter Roeck'" <linux@roeck-us.net>
Cc: "'Jean Delvare'" <jdelvare@suse.com>,
	Linux Hardware Monitoring <linux-hwmon@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: hwmon: (nct6775) Regression Bisected
Message-ID: <ZQVzdlHgWdFhOVyQ@debian.me>
References: <002101d9e7e0$f67c4490$e374cdb0$@telus.net>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AluMnGFlloizBdqj"
Content-Disposition: inline
In-Reply-To: <002101d9e7e0$f67c4490$e374cdb0$@telus.net>


--AluMnGFlloizBdqj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 15, 2023 at 07:28:57AM -0700, Doug Smythies wrote:
> Kernel 6.6-rc1 has an error during boot. The guilty commit is:
> b7f1f7b2523a6a4382f12fe953380b847b80e09d
> hwmon: (nct6775) Additional TEMP registers for nct6799
>=20
> There seems to be confusion between the indexes into
> the NCT6799_ALARM_BITS array or the
> NCT6779_ALARM_BITS array. I do not understand the code
> and do not know if it is the indexing that is reversed or the
> wrong table is being used.
>=20
> The error from kern.log (edited):
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> UBSAN: shift-out-of-bounds in drivers/hwmon/nct6775-core.c:1757:39
> shift exponent -1 is negative
> CPU: 9 PID: 822 Comm: sensors Not tainted 6.6.0-rc1-stock2 #1165
> Hardware name: ASUS System Product Name/PRIME Z490-A, BIOS 9902 09/15/2021
> Call Trace:
> <TASK>
> dump_stack_lvl+0x48/0x70
> dump_stack+0x10/0x20
> ubsan_epilogue+0x9/0x40
> __ubsan_handle_shift_out_of_bounds+0x10f/0x170
> ...
>=20
> I added a "pr_info" line (in the below it was as of the prior commit,
> 43fbe66dc216 hwmon: Add driver for Renesas HS3001):
>=20
> doug@s19:~/kernel/linux$ git diff
> diff --git a/drivers/hwmon/nct6775-core.c b/drivers/hwmon/nct6775-core.c
> index 33533d95cf48..12e3df84c034 100644
> --- a/drivers/hwmon/nct6775-core.c
> +++ b/drivers/hwmon/nct6775-core.c
> @@ -1727,6 +1727,7 @@ nct6775_show_alarm(struct device *dev, struct devic=
e_attribute *attr, char *buf)
>                 return PTR_ERR(data);
>=20
>         nr =3D data->ALARM_BITS[sattr->index];
> +       pr_info("doug: nr: %d  ; index %d\n", nr, sattr->index);
>         return sprintf(buf, "%u\n",
>                        (unsigned int)((data->alarms >> nr) & 0x01));
>  }
>=20
> And for b7f1f7b2523a got (edited):
>=20
> nct6775_core: doug: nr: 0  ; index 0
> nct6775_core: doug: nr: 1  ; index 1
> nct6775_core: doug: nr: 2  ; index 2
> nct6775_core: doug: nr: 3  ; index 3
> nct6775_core: doug: nr: 8  ; index 4
> nct6775_core: doug: nr: -1  ; index 5
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> UBSAN: shift-out-of-bounds in drivers/hwmon/nct6775-core.c:1758:39
> shift exponent -1 is negative
> ...
> nct6775_core: doug: nr: 20  ; index 6
> nct6775_core: doug: nr: 16  ; index 7
> nct6775_core: doug: nr: 17  ; index 8
> nct6775_core: doug: nr: 24  ; index 9
> nct6775_core: doug: nr: 25  ; index 10
> nct6775_core: doug: nr: 26  ; index 11
> nct6775_core: doug: nr: 27  ; index 12
> nct6775_core: doug: nr: 28  ; index 13
> nct6775_core: doug: nr: 29  ; index 14
> nct6775_core: doug: nr: 6  ; index 24
> nct6775_core: doug: nr: 7  ; index 25
> nct6775_core: doug: nr: 11  ; index 26
> nct6775_core: doug: nr: 10  ; index 27
> nct6775_core: doug: nr: 23  ; index 28
> nct6775_core: doug: nr: 33  ; index 29
> nct6775_core: doug: nr: 12  ; index 48
> nct6775_core: doug: nr: 9  ; index 49
>=20
> Observe that the table seems to be
> NCT6799_ALARM_BITS
> But the indexes seem to be for
> NCT6779_ALARM_BITS
>=20
> static const s8 NCT6799_ALARM_BITS[NUM_ALARM_BITS] =3D {
>          0,  1,  2,  3,  8, -1, 20, 16, 17, 24, 25, 26,   /* in0-in11    =
 */
>         27, 28, 29, 30, 31, -1, -1, -1, -1, -1, -1, -1,   /* in12-in23   =
 */
>          6,  7, 11, 10, 23, 33, -1, -1, -1, -1, -1, -1,   /* fan1-fan12  =
 */
>          4,  5, 40, 41, 42, 43, 44, -1, -1, -1, -1, -1,   /* temp1-temp12=
 */
>         12,  9,                                           /* intr0-intr1 =
 */
> };
>=20
> Now repeat the test as of 43fbe66dc216:
>=20
> nct6775_core: doug: nr: 0  ; index 0
> nct6775_core: doug: nr: 1  ; index 1
> nct6775_core: doug: nr: 2  ; index 2
> nct6775_core: doug: nr: 3  ; index 3
> nct6775_core: doug: nr: 8  ; index 4
> nct6775_core: doug: nr: 21  ; index 5
> nct6775_core: doug: nr: 20  ; index 6
> nct6775_core: doug: nr: 16  ; index 7
> nct6775_core: doug: nr: 17  ; index 8
> nct6775_core: doug: nr: 24  ; index 9
> nct6775_core: doug: nr: 25  ; index 10
> nct6775_core: doug: nr: 26  ; index 11
> nct6775_core: doug: nr: 27  ; index 12
> nct6775_core: doug: nr: 28  ; index 13
> nct6775_core: doug: nr: 29  ; index 14
> nct6775_core: doug: nr: 6  ; index 24
> nct6775_core: doug: nr: 7  ; index 25
> nct6775_core: doug: nr: 11  ; index 26
> nct6775_core: doug: nr: 10  ; index 27
> nct6775_core: doug: nr: 23  ; index 28
> nct6775_core: doug: nr: 33  ; index 29
> nct6775_core: doug: nr: 12  ; index 48
> nct6775_core: doug: nr: 9  ; index 49
>=20
> Observe that the table seems to be
> NCT6779_ALARM_BITS
> And the indexing seems to be for that
> Table.
>=20
> static const s8 NCT6779_ALARM_BITS[NUM_ALARM_BITS] =3D {
>          0,  1,  2,  3,  8, 21, 20, 16, 17, 24, 25, 26,   /* in0-in11    =
 */
>         27, 28, 29, -1, -1, -1, -1, -1, -1, -1, -1, -1,   /* in12-in23   =
 */
>          6,  7, 11, 10, 23, -1, -1, -1, -1, -1, -1, -1,   /* fan1-fan12  =
 */
>          4,  5, 13, -1, -1, -1, -1, -1, -1, -1, -1, -1,   /* temp1-temp12=
 */
>         12,  9,                                           /* intr0-intr1 =
 */
> };
>=20
> You probably need this information:
> nct6775: Found NCT6798D or compatible chip at 0x2e:0x290
>=20

Thanks for the regression report. I'm adding it to regzbot:

#regzbot ^introduced: b7f1f7b2523a6a
#regzbot title: shift out-of-bounds in nct6799's additional TEMP registers

--=20
An old man doll... just what I always wanted! - Clara

--AluMnGFlloizBdqj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZQVzcQAKCRD2uYlJVVFO
o1X3AQD0fNDkySWtupkHq4Tw/Dq/1AfM76ZbKKAbYkntgEf9agD/TlovpNpJ+pfP
QVHZn5ciuvAtolQIQb2XQlq9K9V04A0=
=QoPl
-----END PGP SIGNATURE-----

--AluMnGFlloizBdqj--
