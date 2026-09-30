Received: from sender5-op-o15.zoho.com (sender5-op-o15.zoho.com [165.173.182.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D2A4ABBCF
	for <regressions@lists.linux.dev>; Wed, 30 Sep 2026 11:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790769514; cv=pass; b=Lx13Ss/g1mmkFMWAIvYGdmocJDrGrakdXI+cuz6jMF2bStEG5p8QnWAjT/G3QtC+FcWQuyIlf35GTtwN1+f/0Sm+o82CV/413zQGbVeS3nszUjLjjDcWOJ8vO+dRIZl3G5QNe/rRsh4PJvfORag22bicbNzdVtUao1isVVHnaMU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790769514; c=relaxed/simple;
	bh=hJv74KS3ERGLPl4eQadzPTU2vW80DErW/66pSf6x0aU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JDtom+Y+VEfnm7xkVFuVkqW/zO8DkGZi+DnjvP0AhMUHf/TgNGosz18eleaV/BGgJXhaQeDKJJIZSdehPvJdY3YrXklVL7m/yIcf+FBluTBPuS4EOEZyNqlN4+v1mDyjnvASEB1Ovk6kEY0MJnnpneOy10yD5W6+kDorC1mFPd0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=harin.net; spf=pass smtp.mailfrom=harin.net; dkim=pass (2048-bit key) header.d=harin.net header.i=me@harin.net header.b=HHotFc8t; arc=pass smtp.client-ip=165.173.182.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=harin.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=harin.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=harin.net header.i=me@harin.net header.b="HHotFc8t"
ARC-Seal: i=1; a=rsa-sha256; t=1790769511; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nJNDy5YYSTvAVqM3hpSTaZoiURL5LIlnb/xUdEH25vfzKCnvPFcGovzrreNWo1Zx7WJpRX/xUb2TbtLOT1CdY/XiJxSkgveRe0/8fPEgTq+STxcRscsZNHOjYhMf9Gt21/p0Fv9bv6KMP65DF/lW42kp1HsVGUy7+Pn/LJ88Pbk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790769511; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=kLL4d4EZaBohg01WXmA05UXX4aLrLNyzQd0oVuYdvfs=; 
	b=gQWbMNw0S3oLiNlia3Sb1b/eoPgd1rvF3Jy806YeW8Yalipuw3FrBq1auQ8IWILLgrAcfye8fZ6hrcJp3c/zzLCkDZetCQTze+xN5jA91xSChaRHxk6FlHGGhC7Njb1LQvWRcpAcfRFIijC9iSgdYeT7mSXbAi/dfIfcL9T0BT0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=harin.net;
	spf=pass  smtp.mailfrom=me@harin.net;
	dmarc=pass header.from=<me@harin.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790769511;
	s=zmail; d=harin.net; i=me@harin.net;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=kLL4d4EZaBohg01WXmA05UXX4aLrLNyzQd0oVuYdvfs=;
	b=HHotFc8tEriokDiEr0+Rf9NlFAwkUbr4EojI+lWbKt0kVF2MYLQuZFAOheE0k7os
	QaXvheA3/Kk6PEcdTxNdOL9fXBLG5zuEPLLTiLS8MPcarS+LUeOTVuPH/C0X12tXpS7
	uskvao73M69QaC82Z3dcTjT2vKgiOPPbjpxXd2Uke6E7meB6THW/AVSyfkDlKHbFCG6
	etIaBRTxvBUTUE+0m2aLRxyl2Qcb5wdz6WddEC90bRMRPARO9AhyWXrzoiMo3fBskO2
	majJSW5ep0xxpJg5OB3+UMB+M1nPkntclytl6Nv5kJkDYatrMHm1qynfAZIv2JrsnMk
	w5K1QzKOoA==
Received: by smtp.zohomail.com with SMTPS id 1790769508781993.0474100814089;
	Wed, 30 Sep 2026 04:58:28 -0700 (PDT)
From: Harin Lee <me@harin.net>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Dany Patoine <dany_patoine@hotmail.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	Harin Lee <me@harin.net>
Subject: [PATCH] ALSA: ctxfi: Fix silent playback on Titanium HD (SB1270)
Date: Wed, 30 Sep 2026 20:58:24 +0900
Message-ID: <20260930115824.739412-1-me@harin.net>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Commit 4b490e0d103c ("ALSA: ctxfi: Add ADC helper functions for GPIO")
moved the GPIO_DATA read into hw_adc_stop(), but the Titanium HD
(SB1270) setup in hw_adc_init() uses the local data variable holding
the GPIO_CTRL value.

Writing this value to GPIO_DATA sets the output mute bits. Playback
runs without errors, but the outputs stay muted.

Re-read GPIO_DATA before setting the speed mode bits. Also, add the
delay after writing the mode bits, as in the original sequence.

On affected kernels, switching the output selection was reported to
restore clean playback.

Fixes: 4b490e0d103c ("ALSA: ctxfi: Add ADC helper functions for GPIO")
Cc: stable@vger.kernel.org
Reported-by: Dany Patoine <dany_patoine@hotmail.com>
Closes: https://lore.kernel.org/linux-sound/DM6PR02MB5433A42E81FEFAC400DD1905EA8B2@DM6PR02MB5433.namprd02.prod.outlook.com/
Signed-off-by: Harin Lee <me@harin.net>
---
 sound/pci/ctxfi/cthw20k2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/pci/ctxfi/cthw20k2.c b/sound/pci/ctxfi/cthw20k2.c
index 36066ffe8784..26a6fa69f5f5 100644
--- a/sound/pci/ctxfi/cthw20k2.c
+++ b/sound/pci/ctxfi/cthw20k2.c
@@ -1895,6 +1895,7 @@ static int hw_adc_init(struct hw *hw, const struct adc_conf *info)
 
 	if (hw->model == CTSB1270) {
 		/* Set up the PCM4220 ADC on Titanium HD */
+		data = hw_read_20kx(hw, GPIO_DATA);
 		data &= ~0x0C;
 		if (1 == info->msr)
 			data |= 0x00; /* Single Speed Mode 32-50kHz */
@@ -1903,6 +1904,7 @@ static int hw_adc_init(struct hw *hw, const struct adc_conf *info)
 		else
 			data |= 0x04; /* Quad Speed Mode 108kHz-216kHz */
 		hw_write_20kx(hw, GPIO_DATA, data);
+		usleep_range(10000, 11000);
 	}
 
 	hw_adc_start(hw);
-- 
2.55.0

