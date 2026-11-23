Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795427224;
	b=G7/oaD+rHysvtLAsbIoxfnqBZz8HB0u8Kd7s6iD4TZQt+ZeUEAoz1fyrvB8UqHZ3ri1u
	 CY2eQkdSjF3YX0oXj4sgRjunEtg6YA/vNJCWV9Z/LYHmWoSMy14QiCm0p72oqzqrIkpLs
	 v8MQR3zXZWK1JCJWYTExJ+p8rJ1RCZhwa7BWCgmfcCb4zD6TDgjkYkn1ZV38eZl1sR4EE
	 a/jXBr21NjBt0liFrqprgONgcDES8NUpM0s/VJc6qzxkeukcbZG9bly3gA+VID02Q0FZb
	 zotkPxgFeq2pAjyaZYaHiFF4NUY+TYWDbqEJQi4qVjB3oEs+VG/44EVzgKrW3WNPRnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795427224;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Message-ID:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Correlation-ID;
	bh=QKKddyB/3LPaj9XpOHrjBXWO+kDb0/gFR60jM/AbPd4=;
	b=S9r8dUXN0T2l9BFFkwJgTmGdD0F6qAP83BExL3ArlaALYrYgK/TtYu6LOexQn14uqnnA
	 g6C6xy6uwGDADL9ji0sA5l/t9H4DoHix6AtCF91ExqrV67kCS9u92cLKPBDRJNSkemoVl
	 97JBM95XraYbwqnoRUMeK1Bj8i20ksCg95XtjeGhgmajGYe1S2Zvo3GMQ25lm70KnGpYi
	 WWZ5jwii1fbxPeIL82rfbepep1a1JqDe5mqpUTRhFizfohFBXCMLRGJb1R8DpFGcPRtr0
	 pWNoNjs+MWLHizY1wGa7hTC8mczniJ+Y5NUHL0fMKdJ4bnXF6goWg1GQA79qFOcLxaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zW+C5Osj;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1EFB606A31E
	for <regressions@lists.linux.dev>; Mon, 23 Nov 2026 09:47:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1EFB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zW+C5Osj
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48e47347279so1748634f8f.1
        for <regressions@lists.linux.dev>; Mon, 23 Nov 2026 01:47:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795427222; x=1796032022; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:subject
         :message-id:cc:to:from:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QKKddyB/3LPaj9XpOHrjBXWO+kDb0/gFR60jM/AbPd4=;
        b=zW+C5OsjyVPTCx3/5FxXT+q0PZV/L3N55gFlgW17W8LerHKlltoYzUgyFPjSqgLedf
         tT2ghEqouTYPMBmCkUj/XnaJ1hxPPPcVeg8tczzAmlttlp1vBKbbjjKqvLtTGjSiNjze
         ZIQx7uw2IUzlrsCNdPF8uZ72C8nrx4mhM5ijBJQ9ISK5E0adSl/jGt7fctvhPvTLcID6
         yFyTz+mYB425X6LyN63/yNvIMefZH5YGh5uSc7GubK2RIo+hHFlr9LJNy61DHTc8AyG8
         G7G7ZzLSg78XlBhE9PTETEuJ5SU43nycpo93MQUqtcf5daxyeU1xjtLqDhsKvZAdx/uP
         07Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795427222; x=1796032022;
        h=content-transfer-encoding:content-type:mime-version:subject
         :message-id:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QKKddyB/3LPaj9XpOHrjBXWO+kDb0/gFR60jM/AbPd4=;
        b=bZ7JRqucuwpRd20Iy4NnONzzX6ZjBhjotT6zpuHn4h1HNPebSll/CRQqwVOUUrsnh4
         edPZHZv0+HyFQjFQBn7ZcpFOK9ydoMQjJ2e7ZWjwkk3pPi95TRfPNgDiZ5uEv5mnUDdS
         VUujktUMjig2vTiV70UAZ7OzOO9GYzSHm5UnfIGDLthojyuDi6v7YovSVLneiwWh71R3
         lL5IH4BYUt0O3dyNHD4l5u/jsEQXIzv700s4WsfwxnHg0Qo+U6s1pLS6s1vAIt/7RVTn
         j2R+udKfjj1yvnKA8059tes+CnhxD0uvzB32T72XmmMLph9hrJLB51FMqzE9pGVkToQn
         tPrw==
X-Gm-Message-State: APuU4Z/CTZK0cLRLzbCP5AyjGl89/mxMvnylHobKLCf7nYdSwGaXmKYc
	UAMtTEvUohhQshtz/xFEoCEb/jhG00G2cZifKHAJ4epxwQ8/alGpQJ6MaRlR2HL5
X-Gm-Gg: AZFdTZe25GJwFp9GGxH83GIiK9wj541KbPqZ1gMohTf+NEoQpsYFfjnLZrMUFrCsxxR
	YHdtLV2L5jlOErL6AcVgrtpB2Rs5euUD6EjdVwrKG4/fZPDSqSWWQzEl3zIuWNGqxcRKufqYzmR
	v/XOPGc/BYjLBlc7PO0wmIqNAb3ABKVyuPlum005QBlmuuOORdmLcGprJalNr4GGnSHr8SF/HoH
	jJUaT/EaIO2ezpeRVWr/8wBkcl53akwOCzDS4rPJ4komSLZYFts7MEzRTIrqZuSIjcPWUKfZbl6
	V7pfN1Gh6mQ03XdBd/e/kjTGqfVswyxWTcx2VBoLtqSjKUOld8oZyWtTJGtSF9/OCoGW5fQzlXm
	eoiNKOiJfq+z5bc/rT5mxSIrDIAXHCWXV7yQCIh3d3b0EBo6UPtsu7rmFIDpH2FUC4lGc+e96Zn
	oysmgEnrQbdoFTPSzCffwYA/V2wwAH+CfqpaFqVmh29ToEP8HErcPa4ry2I5XdrJFdxXN9RW3L1
	gWliQk/rYbnJunIskQ2XwK1HdcZco8L6RI6rsq1yeS6kL3mYKweV0LG6h1FBpnYgOIhkldHntgk
	AYjSBFjm66Lki+6ZVvfiXC8xwQg5nrRMbt4VoST1EYbfjIk1EQ==
X-Received: by 2002:a05:6000:29c6:b0:4a9:b2f1:aac4 with SMTP id ffacd0b85a97d-4abb42ea141mr14220172f8f.22.1795427221995;
        Mon, 23 Nov 2026 01:47:01 -0800 (PST)
Received: from [127.0.0.1] ([187.40.49.252])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a68048esm21834603f8f.29.2026.11.23.01.47.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 01:47:01 -0800 (PST)
Date: Mon, 23 Nov 2026 10:46:58 +0100
From: Marcus Lell <marcus.lell@gmail.com>
To: linux-btrfs@vger.kernel.org
Cc: regressions@lists.linux.dev
Message-ID: <b8b122c5-87c7-4363-b3cc-c91d24ff4d2d@gmail.com>
Subject: btrfs corruption across different storage configurations. Both with
 free addressable free storage.
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Correlation-ID: <b8b122c5-87c7-4363-b3cc-c91d24ff4d2d@gmail.com>

[please CC me, as I'm off list]

I know it's a late report, but I thought, you may know about this one...

I experienced severe Btrfs corruption twice, on Linux 7.1.10 and 7.1.12, us=
ing substantially different storage configurations.

Incident 1 =E2=80=94 Linux 7.1.10

I was running Btrfs on LUKS/dm-crypt over md RAID5, using four SATA devices=
 with 64 KiB chunks. The incident occurred during or after a RAID5 reshape =
and enlargement of the encrypted device. After enlarging the crypt layer, I=
 tried mounting the filesystem, but "mount.btrfs" failed.

Subsequent diagnostics revealed metadata errors at offsets beyond Btrfs's r=
eported size:

"total_bytes =3D 20001389936640"

- Wanted bytenr "20015028908032", found "8567551700635656859"; checksum wan=
ted "0x836ea028", found "0x8db80d65".
- Wanted bytenr "20024023199744", found "12778909791338521120"; checksum wa=
nted "0xfd168e20", found "0x95744024".

These offsets were approximately 13.65 GB and 22.64 GB beyond the reported =
filesystem size, but within the underlying device's addressable capacity.

I did not touch the underlying filesystem during the enlargement. Just at t=
he end. I was surprised, that an untouched filesystem could go so messed up=
. I thought, it could be an mdadm grow failure.

I made extensive attempts to diagnose and recover the filesystem. I tried s=
uperblock recovery, "btrfs check --repair", "btrfs restore", "btrfs-find-ro=
ot", mounting with recovery options, and "dmsetup"-based approaches. I also=
 used a device-mapper snapshot to rule out concurrent changes during checki=
ng. Despite these efforts, I could not restore a usable filesystem. "btrfs =
restore" recovered some files but reported checksum errors.

Incident 2 =E2=80=94 Linux 7.1.12

I was running Btrfs on an approximately 1 TB root logical volume on LVM, on=
 a single 2 TB NVMe device, without md RAID. The root filesystem became unu=
sable. I recall seeing what appeared to be the same kind of "bytenr" failur=
e, although I no longer have the logs to confirm the exact error. I had not=
 observed unusually large writes before the failure.

I lost the logs of the first attempt, that I saved on the root partition. I=
 was like to be afraid to cope with the responses of you. (I'm shy)

Because the second incident occurred on a substantially different storage c=
onfiguration, I find it less likely that the problem was specific to the RA=
ID reshape or crypt-layer resizing in the first incident.

I want you to help make the btrfs filesystem more error prone. But I can on=
ly point into the direction. I cannot prove that such a write occurred or t=
hat both incidents shared the same root cause, but I believe the recurrence=
 and the first incident's specific offsets warrant investigation.

I don't know, how to help further, but I don't dare to trust Linux 7.1.x an=
d successors, with 7.0.x I believe, this is the last stable one. I need to =
upgrade sooner or later, so please find the root cause of this behavior...

Marcus Lell


--=20
Return to the point of no return._

--=20
Return to the point of no return._
