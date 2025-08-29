Received: from mail-107164.simplelogin.co (mail-107164.simplelogin.co [79.135.107.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90217B676
	for <regressions@lists.linux.dev>; Fri, 29 Aug 2025 11:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=79.135.107.164
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756467395; cv=pass; b=Q08D1xqv7z2eQ/d8+oN/TOjr9tp4oIIViCr9hCKfIwvsmNyF5W0V6BXVxO5Rd9pFTqgpRwZ91j69orbA8QbiXZ5RnDinftxyJNSA51U2Pfa6JKKj0tcIaWUiL52llhnbQ9vNttb5Sojc/riY/rHwr2XtHEyWgVLkpu2nF6orCII=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756467395; c=relaxed/simple;
	bh=n5DoHCNywup6l9+BRLWy4SYpfOtSuxQUT+2Jlv4Y8nY=;
	h=Date:Subject:MIME-Version:Content-Type:From:To:Cc:Message-ID; b=vCGZHAT8e1yXHIzAT9JA8dn28DO/tG+GBhE4gIA6YQBvvnE9unqKyPB/+BiTavUdSLllgqQUsPPMODArVWtn/RHrBmZ4noBUI4R19Etqc+vciwsIvVesV8ZIbnJWvpD3b7BwH3wNIuD1oFFX+JUyElAJM8CYOuW2SkTWIFHO9ok=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=simplelogin.com; spf=pass smtp.mailfrom=simplelogin.com; dkim=pass (1024-bit key) header.d=simplelogin.com header.i=@simplelogin.com header.b=e5mSuqV0; arc=pass smtp.client-ip=79.135.107.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=simplelogin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=simplelogin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=simplelogin.com header.i=@simplelogin.com header.b="e5mSuqV0"
ARC-Seal: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626; t=1756467386;
	cv=none; b=YB0t0JmMhlI8gsOr+MH9DuOK+pOZvWl4sMCiabMWkaCrKEOzP2ZWWsGnC4fjc66lyRaeCv4fblXqttmcOkV4XRWREDWyXxyQSf49gx1D1dWhUHctlIFm0TVNqU3sC741WBK4m6lp5ex4VgJ36o+3n7vgIj3LXGi3/UmgyONbGNcCm27WvMfeiol7RWarQzmpJibVlTZjYIlba+g3pcTq3oVUkZp69z6sbtozMz3uHRQdDu/NNJcHAfjIOmhNrJfwNN0V4rdjjQaeClZ4f0ShUvKGJS+8mo85UR/FLfEB698ky/XooynvzeCxRf6K6zpoO/af4RjXdKLHkGSKp+UC1w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626;
	t=1756467386; c=relaxed/simple;
	bh=n5DoHCNywup6l9+BRLWy4SYpfOtSuxQUT+2Jlv4Y8nY=;
	h=Date:Subject:From:To:Cc; b=y5MKKGtDw6rsBCBH/1ezCZmrpHKWMJINC89gdrRn5uWr/WtCjEyk+dcazIIhWori3K/mOcrNxyj3PWABPytw6WzlAnXs25L+1GtvbsHbQOZ2s0WXhGXg9bbGZYw96BXr5HJQSz3pqPcToAKVAe2oFCIM1oqEaYIYEf16ckNGrHiFGIERGKeGpemlOaK2uMqiUWc9WYqATaUooafrWD8McY+EiRpTabnDohInlm3kdRFbx13FaHpDZBgb/PNxgILXGkiEr1ho1U4wgnqhuZCnooxntJsL1Ja8X4mPxbuAXPBFGqnTrDAgsizRa2YzGVf87rU6jdDigo3Um/ZMaFgetw==
ARC-Authentication-Results: i=1; mail.protonmail.ch
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=simplelogin.com;
	s=dkim; t=1756467385;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=n5DoHCNywup6l9+BRLWy4SYpfOtSuxQUT+2Jlv4Y8nY=;
	b=e5mSuqV08ySpUz1i+5D0S+8mlpchjtmJzzUpP8dnnnmlcjuOheHlLeXSmOqL7G+vfIVBqZ
	A4QLu08Y87Ke5+Qsa98WtohyVs3Fdh7Zc1dqsPx+dC+gOqg1Eel+l4bcS/wq5PTOVQ4Lvi
	g/rGe77aFOKcSkV08CfTIwje0I72ODw=
Date: Fri, 29 Aug 2025 11:36:18 +0000
Subject: Re: Bug report - Sticky keys acting not sticky sometimes
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg=pgp-sha512;
 boundary="------a3bdc29b6e5aab888bbfaee2534b07ce6e38dc4f5969853691b6d737927ae055";
 charset=utf-8
Content-Transfer-Encoding: 7bit
From: Alerymin <alerdev.ca4x6@simplelogin.com>
To: stable@vger.kernel.org
Cc: 
 regressions@lists.linux.dev,dmitry.torokhov@gmail.com,linux-input@vger.kernel.org
Message-ID: <175646738541.6.2676742517164037652.877606794@simplelogin.com>
X-SimpleLogin-Type: Reply
X-SimpleLogin-EmailLog-ID: 877606799
X-SimpleLogin-Want-Signing: yes

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------a3bdc29b6e5aab888bbfaee2534b07ce6e38dc4f5969853691b6d737927ae055
Content-Type: multipart/mixed;boundary=---------------------2a429f09b9a235ef4171a0b772069893

-----------------------2a429f09b9a235ef4171a0b772069893
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;charset=utf-8

Note:
The issue looks like it's from tty directly but I don't see who is the mai=
ntainer, so I email the closest I can get

Description:
In command line, sticky keys reset only when typing ASCII and ISO-8859-1 c=
haracters.
Tested with the QWERTY Lafayette layout: https://codeberg.org/Alerymin/kbd=
-qwerty-lafayette

Observed Behaviour:
When the layout is loaded in ISO-8859-15, most characters typed don't rese=
t the sticky key, unless it's basic ASCII characters or Unicode
When the layout is loaded in ISO-8859-1, the sticky key works fine.

Expected behaviour:
Sticky key working in ISO-8859-1 and ISO-8859-15

System used:
Arch Linux, kernel 6.16.3-arch1-1
-----------------------2a429f09b9a235ef4171a0b772069893--

--------a3bdc29b6e5aab888bbfaee2534b07ce6e38dc4f5969853691b6d737927ae055
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wrsEARYKAG0FgmixkKQJkOLfGQMiQb0dRRQAAAAAABwAIHNhbHRAbm90YXRp
b25zLm9wZW5wZ3Bqcy5vcmfTkqPJNkGeCHWxoJzCDGaTeoq+AMlCzt0LqPcI
IlruHRYhBA/2MWvcJ0ye/0b56OLfGQMiQb0dAABIgAD+NuL4jcK/RKvUdskM
n6FkZTldQiUuCyUrX4G4YHVuyfoBALiduiZYfYIiL1itze8hd9zWWXnCF7HV
3bIzIlVhQQ8C
=BCRE
-----END PGP SIGNATURE-----


--------a3bdc29b6e5aab888bbfaee2534b07ce6e38dc4f5969853691b6d737927ae055--


