Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794086775;
	b=quezAju8VJ6m+EKCargDgUsANSXq+OSlV9aR0fOXEjLXrWT4n/YmgTlZ/LpAdsyk5pD6
	 oCrKqQ6mcctiOG8YFHGD+mwakAO/zgpP1Ov9LUv/FblPciHaveEXi2yb/xVfxyBItFup3
	 qfuKmWARVnKqUhq2lueOcfQ1yt78p3+GSyjIv2pKsjQ+04vE1FVqRO022Ommg8siaJOEl
	 qENvEgS6/bs20ajPBwzKDub6XRay/++U22/LLahAmL9XbI2jqCsG6G2TGi6S7iOknvrv7
	 P2ldODqq6wcAiAmzczOryFbRMm5c/ZlerYD3zOlZUOHyVATtSztG0Gfaqmeucy2BD+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794086775;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=73WEKiUzXivXg8C2IVBJyfaF2fqfQiUkwdvZf6j6LfU=;
	b=hPD1EE/RYx13GOiVlKjLp17qgQ/YgjnI39MmGnDOTNUlBPKHbviZYQeN3qush36XfaqM
	 +jYklTN9qsdTtKdf8Nl6EkmJHGHZZX+tYo8ChGmZWKxxQiPzKFw1cbvV2XjpKQL6c8AkR
	 jDp4+mehnqCpQeN5QAi6RmjYfLLdxu/g5JL9cj+hczcqlBysw4IjijKrzeBqKY3SF4zV5
	 RVa2qSbH9IBO6SqwHcbgF/06T2a4TlXAdXmYoNRKf74M7cQwbMh35AgYlDDGoVl4v8Zoa
	 daGt08XkDjhBVq/NSLEWGUH9R6Nv7B7dCdsMZd8dWKN2aa5SMThEzNCok9KorKqilag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=twUT8A6B;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF43606A32C
	for <regressions@lists.linux.dev>; Sat,  7 Nov 2026 21:26:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DF43606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=twUT8A6B
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so53369f8f.1
        for <regressions@lists.linux.dev>; Sat, 07 Nov 2026 13:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794086774; x=1794691574; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=73WEKiUzXivXg8C2IVBJyfaF2fqfQiUkwdvZf6j6LfU=;
        b=twUT8A6Bk9eX6psoJ0H0Exu4p6Cl4UcItkYk/ZzzaH0sa8gNwIkdGd5HVMW4+ElU7B
         7iDF3mTuiKoTxcuzib1jlwc3AsrXAKKnsrOTwc6sOu1k849bNk9hrUnYmW5PIfqpDUd1
         n2yGNV24Ox+eft2s54kMsY86ptGs7XSjSoKwJuoEhpeg4cn0bj3H5iaFugDzidAo4AVm
         ph8cOJoQeaZvM114nKF1x7UC6j52GTyRG1vpVJm/RdFkwGEiv3kqqXJqj3DUDFoy+CLj
         YsuM6bOEllQgIubCUPGmi+3OsZgp9nb3gnv4CwExidM8pSzQQ2p6qvi0xNrfHbi7HB6s
         71PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794086774; x=1794691574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=73WEKiUzXivXg8C2IVBJyfaF2fqfQiUkwdvZf6j6LfU=;
        b=jUAK5/VIBNDZW/aYiOHMyyVksiKtLcgIuefj57jDsfGIzUCfgVyrrbwfavuvMSPv7x
         rpOPjR4h5/cjqtzjKW/PzypXEW/r5dFwLV8CAnhdYg7e9D6jhUL/9WxTpC1rwFGjLBm1
         fYNlSuKVWGiG9bVNDwZCvNZ1Cezcc+i5vYSZlnvZ/t5iev2dgfiC6M1cZrxxS6uFn/oA
         HVVsPVeMfejuEbCVV5Ae7dZdFpQmko7aelGDPv3mxBnd9iWtNgaTi9u8/7o0ld8q2mpS
         0Ky1Mi6uCDv2MOfw2w/Unr9mTRjPk2M1Oim1A4Dea5cguY3JNx2ngctCdFrLbW8cTshR
         kUSQ==
X-Forwarded-Encrypted: i=1; AL+hErGOZZNw/55fkQdGD4JeHB1fYGZoqxpznBr2FmhYkmMfUNh0e2vuoqrP+TrQ71dJ6I/YUGPda0tEheqowg==@lists.linux.dev
X-Gm-Message-State: APuU4Z/SXCbiT1vFqv0yX2Pz0J0Mev92Tr7/AqeDid7klJzJF1GDgeYW
	tBP4BZ4MPXL7peaexC82IAeM7lToZ6UgCfJXhWzc6WdZiFuoy4s4wObi
X-Gm-Gg: AYBFou1evp0k2/hp4WZ86Mk/OmbjNWdPoRHeykt1yG6ObLe6pSXzIWtZpkfFLj2PTBB
	busrkqwFBW5LkNWkVbFp+2qOmxf5RoIu/LAy1gjTTIp3PSnLeannB/Sf6NDcnLeFBN1vuZfuGBW
	zixLJSYL0gt4rFnpE/VLe4+roBbb6E/ZqzupVoDajfeaUl7OO1+f7PnW+DZwrUFycYI3N8dmeji
	uEhmB71jRU0nVvHnRP0WbvePFF/SBqlqQNKFGFOcm87u7ReijKmKVfsDFXmY2DKoh0/jhoNGYNA
	lY5iZ5uOCXv3nWRVCBLbNx11ko33bZ/shPvZE1N639ABgMIIffeXuTJCUI2WXYhGHN/eMjaJ9oG
	ye1cJy0sx54eo2D0Vsd3/vQs8/CXCLENmm6VZWWFlcQnNV6dXuWd8dkIqJVajGnChqjfoelLyho
	2k8/dleXp7RA0+tHQq5BOx5Acx+ANbUfQw8MKInB0lokj0pqQzXoCLxZBl9GxzRevPYAPThIHxO
	5LD6tLUCAT4pY/hPV3K2RKAM7XJ3qbBX9OWVtdQLEpBiJoQnHPdMiw1bZK3JX9zJYTr7RMqNIcj
	H4Mfpbf1HJT+hKZItl67lsKozY01CRspgHxtk8r0zhD0u2z1zELvilS0OoVtaHPnJ9D2Met0l34
	FoP2jHdy5RGJy/k9aNpV1n3iPO+yipLwLXAybKm27s+sd8n4LbYUTu802F920RR1WmdjoSr0K2Y
	LhnIbWj+lo2gWS4a/sGzMalHOFEEhx+PIQSkzaqtKnt8FzLXMU0ER8MP2gPfCzHnCANh3d8I/9r
	WpW3wS/V3rkvQWR9MM=
X-Received: by 2002:a5d:6f0e:0:b0:48e:43a:1d84 with SMTP id ffacd0b85a97d-4958b34c506mr263267f8f.23.1794086773593;
        Sat, 07 Nov 2026 13:26:13 -0800 (PST)
Received: from px13.tail3a7e86.ts.net (91-201-161-73.ip4.as24916.net. [91.201.161.73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49596ea51cbsm232117f8f.27.2026.11.07.13.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 13:26:12 -0800 (PST)
From: Lee Mann <leepaulmann@gmail.com>
To: baojun.xu@ti.com,
	broonie@kernel.org
Cc: shenghao-ding@ti.com,
	niranjan.hy@ti.com,
	antoine@montane.tech,
	andrey.golovko@gmail.com,
	pierre-louis.bossart@linux.dev,
	matthew.schwartz@linux.dev,
	linux-sound@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH v7] ASoC: tas2783-sdw: add firmware download status check
Date: Sat,  7 Nov 2026 21:25:52 +0000
Message-ID: <20261107212552.10990-1-leepaulmann@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20260921111930.1040-1-baojun.xu@ti.com>
References: <20260921111930.1040-1-baojun.xu@ti.com>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Baojun,=0D
=0D
This patch, now in v7.4-rc1 as f42fbd560cd8, drops the stereo split=0D
from tas2783_sdw_hw_params() (v5 changelog: "stereo configuration=0D
should be handled by the DisCo table"). On the ASUS ProArt PX13=0D
(HN7306EA, AMD ACP, 2x TAS2783 on SoundWire link 1) that table is=0D
never applied, so the split was what gave stereo there.=0D
=0D
The ASUS ACPI declares the SDCA function type without a DisCo constant.=0D
Both amps log "function type only supported as DisCo constant",=0D
find_sdca_function() bails out and the per-amp init table is never=0D
written. ClusterIndex (SDW_SDCA_CTL(1, PPU21, 0x10, 0)) then stays at=0D
0x01 from tas2783_init_seq on both amps.=0D
=0D
Tested on 7.3.1 by ear with speaker-test -c2 -t wav, by swapping only=0D
snd-soc-tas2783-sdw:=0D
=0D
  tas2783-sdw.c from v7.3 (+ a local volume-restore patch, no=0D
  channel changes)             : Front Left left, Front Right right=0D
  tas2783-sdw.c from v7.4-rc1  : Front Left from the left speaker,=0D
                                 Front Right not heard at all, right=0D
                                 speaker silent=0D
=0D
The v7.4-rc1 driver probes cleanly (no tas2783 errors in the kernel=0D
log, both amps Attached), so with this patch the PX13's right speaker=0D
no longer works on a stock v7.4 kernel.=0D
=0D
I agree the split is wrong where the DisCo init table is applied. I=0D
saw that myself with the SDCA fallback from SOF PR #5904 (which makes=0D
the PX13 table apply: 0x01 on amp 0x8, 0x04 on amp 0xb): with the=0D
split, amp 0xb went silent; with the full mask, stereo. So the two=0D
cases need different handling. Two options I can see:=0D
=0D
 - keep the split only when no SmartAmp function data was parsed=0D
   (sa_func_data absent), or=0D
 - land a fallback that lets the ASUS table be parsed (PR #5904 does=0D
   this for mfg 0x0102) before 7.4 final.=0D
=0D
I'm happy to test either on the PX13.=0D
=0D
#regzbot introduced: f42fbd560cd8=0D
#regzbot title: ASoC: tas2783-sdw: right channel lost on ASUS ProArt PX13 a=
fter stereo split removal=0D
=0D
Thanks,=0D
Lee Mann=0D
