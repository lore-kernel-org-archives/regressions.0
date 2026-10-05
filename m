Received: from mta0.migadu.com (out-240.mta0.migadu.com [91.218.175.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2FEBDF72
	for <regressions@lists.linux.dev>; Mon,  5 Oct 2026 02:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791168276; cv=none; b=WtjKF7YOedxIVTyuEwjrKFLmXIf9/zfcYqxZ+iJCYy5zlvIe6vQWv0DwVsRbtp7slt45xLzF+jaMAGC5joC9q+bcTSQKNOpwRf5eiY/blBly4v4I0xetSA+so8AY3DOrlkONukAemN3ypFtxdqZ05bVEPYyKk3KTglgTQLj8Q+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791168276; c=relaxed/simple;
	bh=4+oVFRM4GfDtzhNlYe798i332jr//6Fy6ecJ1GrKyl0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nrx6h5HkZyHnclZSEzoURfGNWacX/jfg+ZflqAeyTPvCzvodqFsrnkKtCto7gnTnMjZjKsArDxI4DITfNMc5aExS+AZWjwcbjNgWjpzckBSust42zEog7Ac01BRpEjJjUkkDGuyU8ldsMbf2uuk7IdfmLyfgR673IB1gl47d6CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=justthetip.ca; spf=pass smtp.mailfrom=justthetip.ca; dkim=pass (2048-bit key) header.d=justthetip.ca header.i=@justthetip.ca header.b=EudYtato; arc=none smtp.client-ip=91.218.175.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=justthetip.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=justthetip.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=justthetip.ca header.i=@justthetip.ca header.b="EudYtato"
X-Envelope-To: regressions@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=4+oVFRM4GfDtzhNlYe798i332jr//6Fy6ecJ1GrKyl0=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791168271; v=1; x=1791773071;
 b=EudYtatoU3a5LkeAEHtYKRkpfO02k0+SK8O088uU45zBANISIVq4HvjHxqzUAbg9LGIobAYK
 BrZ+ryY4SbGX36M2gxKx2Z0Ni/sqAw76TVmmRFgBzdHuBeeX7/d74WqQbOFbpL6uU1G7fm4uqBR
 bpfB7QqiG+MuepIrxG6R0jC9oBLStnhI/uNM4Hy97v8lgYyQIs+r7NacqBXK6ckzJTCftbmYCAG
 hqrKuKBxVefXnINioAJXKezkPVcaZHM2GYYQzseb6L3m2ULL/jCFpLcWg2G2rOZWx33i2IYoYqD
 XxYazYDOsBtnvMTcV9hoD0zC3G6nKp8URZrcVY3kj31KQ==
X-Envelope-To: regressions@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 4523754c24812559;
	Mon, 05 Oct 2026 02:44:31 +0000
X-Mizu-Trace-ID: 4523754c24812559
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Andrei Rusu de Castro <arc@empyreal.works>
Cc: linux-wireless@vger.kernel.org, Jonas Hort <jonas.hort@posteo.de>,
 Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Sean Wang <sean.wang@kernel.org>,
 Thorsten Leemhuis <regressions@leemhuis.info>, regressions@lists.linux.dev,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2] wifi: mt76: mt7925: keep MLD membership consistent
 during link add
Date: Sun, 04 Oct 2026 19:44:27 -0700
Message-ID: <179116826771.8124.9499876634833237978@justthetip.ca>
In-Reply-To: <20261004-mt7925-mld-v2-248bb5e6404f@empyreal.works>
References: <503eb10e-80cf-493e-95fd-04fc0f94ce01@posteo.de>
 <e4bc5ce3-9a6f-4365-9d36-f6440ded0865@posteo.de>
 <c64f5fa6-4c61-45b6-a513-b971e59d7723@posteo.de>
 <476e7721-580e-4a6b-86e5-5ed782a2c7ec@leemhuis.info>
 <c9f984c4-e3c4-4e41-a502-99db97ce724b@posteo.de>
 <20260829221319.25334-1-lucid_duck@justthetip.ca>
 <d245c4b1-dfba-4507-85a2-c6883f5eae64@posteo.de>
 <20261003180334.83575-1-lucid_duck@justthetip.ca>
 <20261004-mt7925-mld-v2-results-248bb5e6404f@empyreal.works>
 <20261004-mt7925-mld-v2-248bb5e6404f@empyreal.works>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Andrei Rusu de Castro wrote:
> USB hardware and the reporter's FritzBox setup remain untested here.

Tested on a Netgear A9000 (MT7925U, USB), Linux 7.2.6, firmware
20260813113118, morrownr/mt76 at ce4ee3e, against a two-link mt7996
AP MLD on 5745 and 6135 MHz.

Your STA_REC_MLD capture reproduces here. Without v2 the AP got
nothing on 5745 in any run I checked. With v2, 5745 carried traffic
under the scan load from my earlier report:

                                      stock          v2
  scan load, 600 s, mean per ~10 s    249, 267 MB    801, 837 MB
  scan load, 600 s, lowest ~10 s      126 B, 33 MB   643, 687 MB
  scan load, share of bytes on 5745   0              about 60%
  scanning off, share on 5745         0              0

Stock dipped under that load but did not stall for good this time, so
the stall result is Jonas's run, not mine.

Tested-by: Devin Wittmayer <lucid_duck@justthetip.ca>

Thanks,
Devin
