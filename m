Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793935602;
	b=5Gsu/bjRV9HBXLH8VYwBMiSiI0TdrNKDQlUFgwY6VKYEHivlMN+wMHSntjQmDnm97s+M
	 DmJ1aB5+kwExC5DtnLeSAD3MGi3qzohCviSaH+IEIz0GwYHgkA2ZrKI7FTgKefpCIHpjb
	 tU19/rB9wtxl0e+P+N9mSINpeEDqjOr5EhKdZNQif33vJfQ/OT3hyRbXPtNYRp1gy6cNJ
	 BSnCZWbyNJA9ktbU0OeNRqvrDU9zVX1r43boWPBrUT+Bkdy35Bs1ZRz5Ii6WcWqy+HFUD
	 kiokbf4ORNgE/UX1pkb8TZmx552iku/bVITBu3TzABmkH+EWh5T6P/vcuTZ/rB1thwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793935602;
	h=DMARC-Filter:DKIM-Signature:Date:Message-Id:References:Reply-To:From:
	 In-Reply-To:Received:X-Original-From:To:Content-Transfer-Encoding:Cc:
	 Subject:Mime-Version:User-Agent:Content-Type:X-Lms-Return-Path;
	bh=GicqH+O3H0yQelB/uFYofYeCG5YOTIFkaNOJy/Z44EM=;
	b=UWBWJUw+wy2O2Ky+3IU+GLOqcrUQ68GUiDkiNhc//E88RdFXeZAG4xSCGxDUWN5uz3SZ
	 DMoyoPwmfYFPF/M5d7omL7oddHtbg9V6J0Wa6WR7abz+Wfy3K3A/umN69OcEfzYIaVUtT
	 IoZ7O4NI9fk53oIjSufb0P0bEk1qgkSkC+Jmj4WySFNvNMBlXWK5MNxF+5zlt7c2qokSE
	 BAd1P1Nm/io1HPPRYLzsB9Meu++M8Abje9UZoiO8xfSUrLII+kq1BveuR5u3bfaCe8nVu
	 nAAOEKTanv0/xm/pF2C0ltMQEbRouOWx3qR0/NbVJIj1ZfmpPQi36sTiw812Bzlmjlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fygo.io;
	spf=pass smtp.mailfrom=fygo.io;
	dkim=pass header.d=fygo-io.20200929.dkim.larksuite.com header.i=@fygo-io.20200929.dkim.larksuite.com header.a=rsa-sha256 header.s=s1 header.b=CcYn3gMZ;
	arc=none smtp.remote-ip=209.127.231.55
Received: from va-2-55.ptr.blmpb.com (va-2-55.ptr.blmpb.com [209.127.231.55])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892CB606A326
	for <regressions@lists.linux.dev>; Fri,  6 Nov 2026 03:26:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 892CB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fygo.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fygo.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fygo-io.20200929.dkim.larksuite.com header.i=@fygo-io.20200929.dkim.larksuite.com header.a=rsa-sha256 header.s=s1 header.b=CcYn3gMZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=fygo-io.20200929.dkim.larksuite.com; t=1793935589;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=GicqH+O3H0yQelB/uFYofYeCG5YOTIFkaNOJy/Z44EM=;
 b=CcYn3gMZZPVbv1GIO/pn7F75MseqFEBWoeXDtEflazMk8lx0qkostupKKmg9u1vUQS1NnU
 Dq1t8aOoSTphAktHKDUDnaPTCmQJt3mIylp+2DeKiqDTIxuqn8imWi8+Z6oGzMoQ/l6oO5
 u5XpQWROwQL7C15yl1CJWyl+llhxYKyO1OR/eweY69JsREk5ckzj/Tv/z3mUf7Il7xzYQ/
 hpgcggVXn4sW+juXsorEg1DWjM8I5ahR26v1NHXXDRXwv+JMUd0/BT5H5qDNk7PXjrWx9w
 wziuCb7l/1hkKh675enoSyUTqoCpbEZNOl7GOgDnInle98G++IVvxsPCa1sueA==
Date: Fri, 6 Nov 2026 11:26:23 +0800
Message-Id: <770fdf93-4330-4094-9807-a0cb449ecb73@fygo.io>
References: <CAO96y0V6oncv54ihXnHfJMYiG_QAQ-NM8BOdqPDXKL8r8-kR9Q@mail.gmail.com> <179299857972.12222.2729359466842183358@gmail.com>
Reply-To: yukuai@fygo.io
From: "yu kuai" <yukuai@fygo.io>
In-Reply-To: <179299857972.12222.2729359466842183358@gmail.com>
Received: from [192.168.1.104] ([39.182.0.25]) by smtp.larksuite.com with ESMTPS; Fri, 06 Nov 2026 03:26:28 +0000
X-Original-From: yu kuai <yukuai@fygo.io>
To: "Konstantin Nikiforov" <helllamer@gmail.com>, 
	<linux-raid@vger.kernel.org>, "yu kuai" <yukuai@fygo.io>
Content-Transfer-Encoding: quoted-printable
Cc: <linux-bcache@vger.kernel.org>, <regressions@lists.linux.dev>, 
	<linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>, 
	<song@kernel.org>, <magiclinan@didiglobal.com>, <xiao@kernel.org>, 
	<colyli@fygo.io>, <kent.overstreet@linux.dev>
Subject: Re: [PATCH] md/raid5: complete unsupported discards successfully
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Type: text/plain; charset=UTF-8
X-Lms-Return-Path: <lba+26aed48e5+c64d5e+lists.linux.dev+yukuai@fygo.io>

=E5=9C=A8 2026/10/26 14:21, Konstantin Nikiforov =E5=86=99=E9=81=93:

> Since commit 90573092673c ("md/raid5: validate discard support at
> request time") raid5 advertises max_hw_discard_sectors =3D UINT_MAX no
> matter whether the member devices support discard or
> devices_handle_discard_safely is set, and make_discard_request() fails
> the discards it cannot handle with BLK_STS_NOTSUPP.
>
> Before that commit such arrays did not advertise discard at all, so
> upper layers never sent one. Now they do, and the failure is not
> harmless:
>
>   - bcache forwards discards to its backing device whenever
>     bdev_max_discard_sectors() is non-zero, and backing_request_endio()
>     treats every non-zero bi_status as a media error. After io_error_limi=
t
>     (64) of them bch_cached_dev_error() stops the cached device. On a
>     machine with root on LVM over bcache over a raid5 of three HDDs the
>     root filesystem disappeared a few minutes after every boot.
>
>   - btrfs enables discard=3Dasync by default on any device that advertise=
s
>     discard, which is what generated the discards in the first place.
>
> Discard is advisory: blkdev_issue_discard() already turns -EOPNOTSUPP
> into success for its callers, and md_submit_discard_bio() silently skips
> raid0/raid10 members without discard support. Do the same here and
> complete the bio successfully when the array cannot pass it down safely,
> so that callers submitting their own discard bios, like bcache, see the
> same behaviour.
>
> Fixes: 90573092673c ("md/raid5: validate discard support at request time"=
)
> Cc:stable@vger.kernel.org # 7.2
> Closes:https://lore.kernel.org/all/CAO96y0V6oncv54ihXnHfJMYiG_QAQ-NM8BOdq=
PDXKL8r8-kR9Q@mail.gmail.com/
> Signed-off-by: Konstantin Nikiforov<helllamer@gmail.com>
> ---
> Kuai, this is the raid5-side change you were fine with in the report
> thread. Reproducer: raid5 over three loop devices with a bcache backing
> device on top, four blkdiscard calls on the bcache device. On 7.2.11
> without the patch bcache's io_errors goes to 4 (bch_count_backing_io_erro=
rs
> in dmesg); with the patch applied to 7.2.11 it stays at 0, and the
> affected machine (root on LVM over bcache over raid5 of HDDs) boots and
> runs with the patched module without any backing-device errors.
> blkdiscard on the md device itself reports success either way because
> blkdev_issue_discard() masks EOPNOTSUPP.
>
> One correction to my report: the "discard_granularity is 0" observation
> was a side effect of my own workaround (writing 0 to discard_max_bytes
> makes the block layer report granularity 0); on a fresh array the
> granularity is the stripe size as expected.
>
>   drivers/md/raid5.c | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)
Applied

--=20
Thanks,
Kuai
