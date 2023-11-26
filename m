Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23AB6377
	for <regressions@lists.linux.dev>; Sun, 26 Nov 2023 00:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RWu+axiy"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6b20577ef7bso2602974b3a.3
        for <regressions@lists.linux.dev>; Sat, 25 Nov 2023 16:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700959204; x=1701564004; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SHq5f/6OqXRrM49Y3ioTgH9keEVnfFWt3uMj717zmSE=;
        b=RWu+axiyQAWG361rqK65hr5msSgYmwvM3zX9kOid97tpZO993cs0wptvUJc8EErFVG
         zbCljccGaNN2zHfOOiaOnwlVz4c1B/x6vDSpYrqUgeGRJkMFj2Z9SQHqg9doInTPxBoo
         5y2r0hiIwnthkPl9ftCTe/8YD863cIes2c0h5ytvT2xgM9nMFieC6mR193qv1h7E/MNl
         y/ZqUUGFHRqymFMsIcaWve2y0Lx6rXtoJTkTueckX9Ntsd3QUR3WMDy+ygqyPYW0Wel2
         gJ4YEIdZ94YBCNCLNXTNYs6lCsqKN3k8uRNk9lLQQ/Au3hSlbWnlGXl1DoAzcN673NDv
         9kzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700959204; x=1701564004;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SHq5f/6OqXRrM49Y3ioTgH9keEVnfFWt3uMj717zmSE=;
        b=aiEfYnzn5kxQeWBWRD8pp8MzhIxV7AlP+O7Jbj4QqnsMDUkHCYTHXaHwShYNmSkAWD
         A/3BkshMrEUJP+XfNitUSlnXWyNRDQq4CmEfCyLVBBUvrZLn0P+SfrFyiOcqlMnuj97d
         llcQ4xmtVDG+ffXP/pXDcoJPHFDKTZ2O26poL2p8sdKKVE4jcA8cGlKExny4nIsqjJQH
         5tMuJBGiIcgHEVLpNoGeCwB0VshztDygDy5i5H0PEy9cktexFy1Qsd72T7uqPz8lAzg5
         FfaTymszzGH4vSHydpd2pJRVQZbmdBiVHaTZIj/qbdQUEQUHJHPK6zLl6Wg/a2/76Jts
         Pbpg==
X-Gm-Message-State: AOJu0YxcXpfS8yY/48XUCmATCpE1Zx8zxXQ5FtokeeDXwtaUybAt0HQI
	/erpqe18SgZu6ql7mGnBYEA=
X-Google-Smtp-Source: AGHT+IHFSW1MZ7Dd1j811im7QwasoW1JS++x8pRpqg9u6W/tsLDDWrGBrM4mUVkGpd0Wf5QioPKoTw==
X-Received: by 2002:a05:6a20:d80f:b0:187:652d:95b5 with SMTP id iv15-20020a056a20d80f00b00187652d95b5mr8387882pzb.62.1700959204217;
        Sat, 25 Nov 2023 16:40:04 -0800 (PST)
Received: from archie.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id z8-20020a1709027e8800b001c61e628e9dsm5635716pla.77.2023.11.25.16.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Nov 2023 16:40:03 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 4AB2B1021185D; Sun, 26 Nov 2023 07:40:01 +0700 (WIB)
Date: Sun, 26 Nov 2023 07:40:00 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Philipp Jungkamp <p.jungkamp@gmx.net>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Mark Pearson <markpearson@lenovo.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: Linux Industrial I/O <linux-iio@vger.kernel.org>,
	Linux Input Devices <linux-input@vger.kernel.org>,
	Linux x86 Platform Drivers <platform-driver-x86@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>
Subject: Re: Empty Intel ISH HID custom sensor feature attributes on Linux 6.6
Message-ID: <ZWKT4PbWq_y7HCLZ@archie.me>
References: <5ab4a33c8750df642c6030412c292890b52b1ae8.camel@gmx.net>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="czvGzu9ywLTIMpAJ"
Content-Disposition: inline
In-Reply-To: <5ab4a33c8750df642c6030412c292890b52b1ae8.camel@gmx.net>


--czvGzu9ywLTIMpAJ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 26, 2023 at 12:51:36AM +0100, Philipp Jungkamp wrote:
> Hello,
>=20
> it seems like the query of custom sensor feature information is not
> working in for kernels in the 6.6 series. I've been using a simple
> shell script to see what custom sensors are present on my system.
>=20
> This is now failing to output any information. All bytes in the
> feature-*-value file of an HID-SENSOR-2000e1.* sensor in the sysfs are
> filled with zeroes. It seems like the underlying call to
> hid_sensor_hub_get_feature does only write zeroes into the given
> buffer.
>=20
> The hid-sensor-custom logic that checks for the presence of my ambient
> light sensor using that logic is also not working, the HID-SENSOR-LISS-
> * device is not showing up. The hid-sensor-hub in question is the Intel
> ISH of my Lenovo Yoga 9 14IAP7.
>=20
> Is this a known problem with the 6.6 series?
> Where there related changes in the modules in the stack? E.g.:
> - hid-sensor-custom
> - hid-sensor-hub
> - ishtp-hid
>=20
> I've not found anything immediatly obvious while checking the git logs.
> I'll try to bisect the issue between 6.5 and 6.6 and report back.
>=20
> Regards,
> Philipp Jungkamp
>=20
>=20
>=20
> This is the fish script to parse the sysfs feature attributes:
>=20
>   set -a properties property-friendly-name:'Friendly Name'
>   set -a properties property-sensor-model:'Sensor Model'
>   set -a properties property-sensor-manufacturer:'Manufacturer'
>   set -a properties property-sensor-serial-number:'Serial Number'
>=20
>   function get_value -a file
>     set_color blue
>     for letter in (string split -n ' ' < $file)
>       test ! $letter -eq 0
>       and printf \\(printf %o $letter)
>     end
>     set_color normal
>   end
>=20
>   function check_property -a property feature
>     if string match -q (string split -f1 ':' $property) -- (cat
> feature/*-name)
>       echo \t(string split -f2 ':' $property): (get_value $feature/*-
> value)
>     end
>   end
>=20
>   for sensor in /sys/bus/hid/devices/*/HID-SENSOR-2000e1*
>     echo Sensor: (set_color green; realpath $sensor; set_color normal)
>     for feature in $sensor/feature-*
>       for property in $properties
>         check_property $property $feature
>       end
>     end
>     echo
>   end
>=20
>=20
> Example output from Linux 6.5:
>=20
>   Sensor: /sys/devices/pci0000:00/0000:00:12.0/{33AECD58-B679-4E54-
> 9BD9-A04D34F0C226}/001F:8087:0AC2.0003/HID-SENSOR-2000e1.7.auto=20
> 	Serial Number: LUID:00E1001A270E0080
> 	Sensor Model: LENOVO_ST_HUMANSENSE S
> 	Manufacturer: LENOVO
> 	Friendly Name: Lenovo ST HPD v201 Sensor
>=20
>=20
> Example output from Linux 6.6:
>=20
>   Sensor: /sys/devices/pci0000:00/0000:00:12.0/{33AECD58-B679-4E54-
> 9BD9-A04D34F0C226}/001F:8087:0AC2.0003/HID-SENSOR-2000e1.7.auto=20
> 	Serial Number:=20
> 	Sensor Model:
> 	Manufacturer:
> 	Friendly Name:
>=20
>=20

AFAIK, this is somewhat related to regression on system76 devices [1].

Anyway, thanks for the regression report. I'm adding it to regzbot:

#regzbot ^introduced: v6.5..v6.6

[1]: https://lore.kernel.org/regressions/b5646db3-acff-45aa-baef-df3f660486=
fb@gmail.com/

--=20
An old man doll... just what I always wanted! - Clara

--czvGzu9ywLTIMpAJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZWKT2AAKCRD2uYlJVVFO
o/BBAP9bwZa+1rK+EcVrk4mVcnmo4ILImzaI4pjsGr9N3L42ZgD/b8lC0ib0Cggu
25faxgjNrVTRJ8nPj6x4eFNzYTbXvQM=
=ayW1
-----END PGP SIGNATURE-----

--czvGzu9ywLTIMpAJ--
