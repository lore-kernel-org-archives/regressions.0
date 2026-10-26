Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792998586;
	b=vgCTbF4/CIhr62KqYqwv/t//nyGSpAHNmY3cCSxk/ZIgjTnfTLBwaqXqQOq1eZ2DNRzM
	 MNxOHInoKVIOZ9vLxT68SSlrGDW1xFtrRZu7anJbq3elh9f0myA4MLC72uk7+EAjh+BQs
	 vC9kla61anTywgwm7wsYeHHA0U1W2cM8ejLYrSoNYu0DykEoOmmZHqlhjzptJXhKTk4TO
	 7M8By3ETXMuFwSZQjGPwo+nj9rbDkIKBWy+49lsj+PGCAaOgw3RKTboEvqlgM549gJKru
	 F24w9Cfkfyfir4rAxafQurdvnnU3LG5XDlx1dSJ8bUPZ41PSJHpFrYFK7tWKm0YJ2HA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792998586;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:To:Cc:In-Reply-To:References:Message-ID;
	bh=NhqYyPv74NL/BY6caRQe870hWekwcUFmd+4G2FhAc5M=;
	b=D51q3o/KJpKcJMfGY+Cm6X6WkOxGHftNcbMV47lbX3ASC+aURNVrSTilZjOdcm5dvFi2
	 Z+81SNeC1f5g6A8iyFn2c/4RiwellD19Tduo4aWqZkUuJ3Byze9JwvFkpMY11GeFCHHik
	 Ns2Tm1jS0xayCNMvx6Bu067NJtyzTtrNxfk4setdXF77t5/KRE/2qhlUZdbIBkk28GSVH
	 tIDMm5JO7KAul6+0xQ0B/rVZRnRg2b4353kxOwyj3AfPzIOfP5OV3oCk4PjStm7s8/ooX
	 urS57AXBieCcmi0Mm+zww2pDQLRhWbASccQfhdRQH0Z16MSBybLR0BOaA08RiePZOMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DFZHPpkL;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E17606A31D
	for <regressions@lists.linux.dev>; Mon, 26 Oct 2026 07:09:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01E17606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DFZHPpkL
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c38ac26cc5dso384419666b.2
        for <regressions@lists.linux.dev>; Mon, 26 Oct 2026 00:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792998584; x=1793603384; darn=lists.linux.dev;
        h=message-id:references:in-reply-to:cc:to:subject:date:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=NhqYyPv74NL/BY6caRQe870hWekwcUFmd+4G2FhAc5M=;
        b=DFZHPpkLxAoitcfG+JxfCT64lolxdNC8t+hhfrfBq92N9Jd94gNPSYFn5DuBs39LT9
         KcGkEdcn/gmIQgps244eaVD1QRYY6+wK0TxoJUKvVj9NwVnlQiTTSUCnQOc65gaKh7ii
         QgPsPWf9+kRrq7BOgkSNL/gLGR1DY9PGETVQEapd6ibcQoHPpJkYJS26GQj+FkqPt3d0
         GMmPypRcJ1leLwGjxmut3xJS0SV5nd8pOFHNmcMiVjn761q1DleYwDcnUYVKMBNrf/gC
         VpxhF+AoRTKl7M1Hc7ekQDNyMgXJr3P1TTGi1Q5TnawaYgQd+Lw6vH5QhQiYGyhy4Add
         RWug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792998584; x=1793603384;
        h=message-id:references:in-reply-to:cc:to:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NhqYyPv74NL/BY6caRQe870hWekwcUFmd+4G2FhAc5M=;
        b=tOYw3c1GP6Njvq+blcuZEqM+gtS5fKg2IbtMyxeWRUuAzInbaiMmwgLSk7IpJO/cDs
         5fgKmDaKhK7KXEDEDj2arCvo0E4FUJ3IPvGgqQHapGtj4cPd5801TMoGmHBdaalh4/Tm
         g4pY0O3gkTxWIrISJAsRh1paa4tFxb3p9RFVhaCVAHJISSwZuwAa5u9pvYti61K1PQ4H
         bnrrdpmLA8xRx8wTDR0jD3ADDpqjPCXjNzkT2eNuNadpdYuZxmkOf3BtHgUH4L4rtrUg
         h8DvGn26bXSZ434dol3+6k3oZ/8FXJqRoAMZ3qwXySPaFasyMYzVE4nfRqbmwsu7vIo1
         9m/Q==
X-Forwarded-Encrypted: i=1; AKwUvBy/a3tZdlqWwTcMA0zW5Ah2QIOTWBqdngLFrHmuIW0Ye9os3rp9pV+XLr9Yc+3AOhtoo2Nw7NHxDVAuHw==@lists.linux.dev
X-Gm-Message-State: AFq9FYKXGQdHr+QZyCNEAiofJaBabeUDuW8ajorjRrjtPdB+qseLqdyA
	ChkH47vR6t4vzuSgWltbGtg70QQCSY5rVZeaCSL1vkQ82dU5CCx9Q+c4
X-Gm-Gg: AYBFou0YVaQfVW6hHwytSJPgb7pFy7izlYD4cFhnC/4fdSS2jqaHgk46XszUFgvd/99
	3V0WRfxwsSFxq7pKRCfj5X+MKjt7YktXyxzL/2y/XFC1tNBZ55ce8iTytmx/J4zbh3PANsxg/4w
	a4HUf9CbhwJS6bcRct0TnjsHE16YKWHwt3uOtOCiay8q6e0TkXNNKC+xgKvp2zCm2H9zH9YnNmM
	H+ciA/C1qPXxSo0y1SIP5ipLgNPQmT0PzUsNYHsQsqkprmZ4Xu7s+2R1awGuX4RGm46x8/VqXPj
	w/ERLtnPWv4GqOcLqP+m1PUwBoZp/ukydCiCcQArxFmsMXCRmiOmKni5vPPNHvhCAzzin+jZPQG
	fzPrvQ+ku9/0P10J8f8dut5ybwEzI9zVmb6sR/AXIlEMfQ1twWr85/GaL8cT92KEHJG4UA7dANe
	i9pkiOSnn7r7wGoLRBASX2NaM6CwvOa3P9BqUQmYQx+aLGk1S9nvA43shVvtWeUKA8CKQwfVTVM
	vmPNA0ntHHyh5AWb+RzlJKX54DnbjwUuMtc3xjC2YCeLmIK8CKbXisn4EuH
X-Received: by 2002:a17:906:c155:b0:c29:f5d8:9c73 with SMTP id a640c23a62f3a-c46bde6e440mr782878166b.34.1792998584236;
        Mon, 26 Oct 2026 00:09:44 -0700 (PDT)
Received: from [192.168.1.182] ([188.241.197.194])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b445991e83sm3363345a12.34.2026.10.26.00.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 00:09:42 -0700 (PDT)
From: Konstantin Nikiforov <helllamer@gmail.com>
Date: Mon, 26 Oct 2026 09:21:09 +0300
Subject: [PATCH] md/raid5: complete unsupported discards successfully
To: linux-raid@vger.kernel.org
Cc: linux-bcache@vger.kernel.org, regressions@lists.linux.dev,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, yukuai@fygo.io,
 song@kernel.org, magiclinan@didiglobal.com, xiao@kernel.org, colyli@fygo.io,
 kent.overstreet@linux.dev
In-Reply-To:
 <CAO96y0V6oncv54ihXnHfJMYiG_QAQ-NM8BOdqPDXKL8r8-kR9Q@mail.gmail.com>
References:
 <CAO96y0V6oncv54ihXnHfJMYiG_QAQ-NM8BOdqPDXKL8r8-kR9Q@mail.gmail.com>
Message-ID: <179299857972.12222.2729359466842183358@gmail.com>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list

Since commit 90573092673c ("md/raid5: validate discard support at
request time") raid5 advertises max_hw_discard_sectors = UINT_MAX no
matter whether the member devices support discard or
devices_handle_discard_safely is set, and make_discard_request() fails
the discards it cannot handle with BLK_STS_NOTSUPP.

Before that commit such arrays did not advertise discard at all, so
upper layers never sent one. Now they do, and the failure is not
harmless:

 - bcache forwards discards to its backing device whenever
   bdev_max_discard_sectors() is non-zero, and backing_request_endio()
   treats every non-zero bi_status as a media error. After io_error_limit
   (64) of them bch_cached_dev_error() stops the cached device. On a
   machine with root on LVM over bcache over a raid5 of three HDDs the
   root filesystem disappeared a few minutes after every boot.

 - btrfs enables discard=async by default on any device that advertises
   discard, which is what generated the discards in the first place.

Discard is advisory: blkdev_issue_discard() already turns -EOPNOTSUPP
into success for its callers, and md_submit_discard_bio() silently skips
raid0/raid10 members without discard support. Do the same here and
complete the bio successfully when the array cannot pass it down safely,
so that callers submitting their own discard bios, like bcache, see the
same behaviour.

Fixes: 90573092673c ("md/raid5: validate discard support at request time")
Cc: stable@vger.kernel.org # 7.2
Closes: https://lore.kernel.org/all/CAO96y0V6oncv54ihXnHfJMYiG_QAQ-NM8BOdqPDXKL8r8-kR9Q@mail.gmail.com/
Signed-off-by: Konstantin Nikiforov <helllamer@gmail.com>
---
Kuai, this is the raid5-side change you were fine with in the report
thread. Reproducer: raid5 over three loop devices with a bcache backing
device on top, four blkdiscard calls on the bcache device. On 7.2.11
without the patch bcache's io_errors goes to 4 (bch_count_backing_io_errors
in dmesg); with the patch applied to 7.2.11 it stays at 0, and the
affected machine (root on LVM over bcache over raid5 of HDDs) boots and
runs with the patched module without any backing-device errors.
blkdiscard on the md device itself reports success either way because
blkdev_issue_discard() masks EOPNOTSUPP.

One correction to my report: the "discard_granularity is 0" observation
was a side effect of my own workaround (writing 0 to discard_max_bytes
makes the block layer report granularity 0); on a fresh array the
granularity is the stripe size as expected.

 drivers/md/raid5.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/md/raid5.c b/drivers/md/raid5.c
index b91545ce090d..b462b18e47ff 100644
--- a/drivers/md/raid5.c
+++ b/drivers/md/raid5.c
@@ -1144,7 +1144,16 @@ static bool raid5_discard_limits(struct mddev *mddev, struct bio *bi)
 	if (!conf->raid5_discard_unsupported)
 		return true;
 
-	bi->bi_status = BLK_STS_NOTSUPP;
+	/*
+	 * Discard is advisory. The array advertises discard regardless of
+	 * member support, so an upper layer may legitimately send discards
+	 * that cannot be forwarded safely. Complete them successfully
+	 * instead of failing them: bcache counts every failed backing
+	 * device bio as an I/O error and stops the device after
+	 * io_error_limit of them, and btrfs enables discard=async on any
+	 * device that advertises discard. This also matches what
+	 * md_submit_discard_bio() does for members without discard support.
+	 */
 	bio_endio(bi);
 	return false;
 }

base-commit: 6b4b543fa18757297ac756a6fe6e64f506b7844a
-- 
2.56.0

