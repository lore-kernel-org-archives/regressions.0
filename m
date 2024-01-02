Received: from mail-200160.simplelogin.co (mail-200160.simplelogin.co [176.119.200.160])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CACC31799C
	for <regressions@lists.linux.dev>; Tue,  2 Jan 2024 22:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=willian.wang
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=willian.wang
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=willian.wang header.i=@willian.wang header.b="hDZ6dqAk"
ARC-Seal: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626; t=1704236204;
	cv=none; b=nC0TqSbpPcKWTvsRR7rfU21nLXMMrBJA2eMiKx2yQzf5IyZouaAgVHBPP9gzjntzoUZeZYnSlPaeoHgXWtDEPcSvhiGktjLHi4QRNTZQ1cTxtJRh6AlikHtYjf7GIVDOxuYGYghNDgjLnfZAChCrHNLd3pG3XChaC+btH1WKqZtZiLPhmDEvC+2VwOO6ebBNSRb4THAowjLoBcI3MLDToau741z4layvEzQTWRpFq5R5rZw7KDqL8V49CIR9VG9lOGlfGgyLS72wwY5cs6UjzolbSsoF46djwHvCyUCUUVu62DMIUsB1KbFIK9sh+r088RjBkNMJQX8qoRcfDDDwjg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626;
	t=1704236204; c=relaxed/simple;
	bh=kWAKk3nloB2r8KYY+fac/aEI7U47DszvlPld13tJ92g=;
	h=DKIM-Signature:MIME-Version:Date:Subject:Content-Type:
	 Content-Transfer-Encoding:From:To:Cc:Message-ID:X-SimpleLogin-Type:
	 X-SimpleLogin-EmailLog-ID:X-SimpleLogin-Want-Signing; b=qUnW+tDfdGjYAY6TEbZx5FQzKVsnZGWMbruXY/cThxqWVUYMv5bMmRZtIiSdNljSSkSwGjZyVGyDh8aA7awVbMWIbwHDtUMpf7Qph2HnunzMmRvJC1OihANdeIWWLAg/PNz+AELX7l/jyFEEnBAgKB4BNBwMfWVd7nqiJxIzxs4E+laAVrlKsKIGb4nhKTHGlTeEmAL29Doq5/tC3PUR06qkRveVP5V7DhamHMC3ktmh4iXyCXNIyi7opDBsBjPA5fC/a34LL+pUB8SbEJG1qFTLr/3mBEbZaWwMRzu2Sf61WsvkN0cldDgryFW/gbptMu8BEOTP/K2dyJ8Sfz9tVg==
ARC-Authentication-Results: i=1; mail.protonmail.ch
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=willian.wang;
	s=dkim; t=1704236204;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kWAKk3nloB2r8KYY+fac/aEI7U47DszvlPld13tJ92g=;
	b=hDZ6dqAkxJrIRdTQHVYPkGWrlfTSbj0zhH9W05oJHKmpOW4YEhOBm6d8HpNEUMOgcPXTjc
	RdmQ2YAI9kFA4pdohowWN+V+LbxnHJYzexEcq95AJkXdtv+rj1qlcPyGtK5BT1As3k4Grh
	uKDPcGdeia3V2W9ELwg6SbspVvqbgRI=
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Tue, 2 Jan 2024 19:56:03 -0300
Subject: Re: Oops in hdac_hda_dev_probe (6.7-rc7)
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
From: Willian Wang <kernel@willian.wang>
To: peter.ujfalusi@linux.intel.com
Cc: 
 tiwai@suse.com,regressions@lists.linux.dev,tiwai@suse.de,ranjani.sridharan@linux.intel.com,pierre-louis.bossart@linux.intel.com,perex@perex.cz,linux-sound@vger.kernel.org,linux-kernel@vger.kernel.org,kai.vehmanen@linux.intel.com,lgirdwood@gmail.com,broonie@kernel.org,alsa-devel@alsa-project.org,linux@dominikbrodowski.net
Message-ID: <170423620368.7.11626876748388238508.241693435@willian.wang>
X-SimpleLogin-Type: Reply
X-SimpleLogin-EmailLog-ID: 241693447
X-SimpleLogin-Want-Signing: yes

Hi, just tested the patch and both sound and resume-from-suspend are
working like 6.6 again =F0=9F=91=8D

