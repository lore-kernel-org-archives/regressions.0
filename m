Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=136.175.108.221
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795143179;
	b=M98vUnerlis42NydFwFTNLS47/eJ2UOtObOgbDuyBqn0+wOLqynGxfibJeMsdcvzg0Ht
	 f+KSfUg0TGXi4eayppxNtVN4jLohngy5Suu9pvaMQRJdspORomHyuy9n0bUe38wXKirwH
	 /4Sli0D8sDg0pVinHPSTh3iQUujvEjZBKzBvaz61aZ3rqcCmzoao/E3dhpKlKXTO+mImG
	 cTJd9fiXcNr9VqDPifMC3uJxz6cZvYAAZNVTeivzuTbvHzCPFGuERIUQsgkYDS6RCae/1
	 zkN2zMHgkMySDnsGbeZaEszc27+22+Fn22oc/h+imFY8QDm7izg0ctGZ+nXGTIiiRHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795143179;
	h=DMARC-Filter:Received:X-Zone-Loop:X-Originating-IP:DKIM-Signature:
	 Message-ID:Date:MIME-Version:User-Agent:To:Cc:References:Subject:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authenticated-Id;
	bh=msYeIQlcLBBah1ScNLjcrzC4Z7h2py1hSnX94ae5ztU=;
	b=S8zAcTr6RDQVTqtoTQ6D+TxfCXmMqTIh60Z45n01mhjs0fHk+eXgCMbitrAJSvQV2W5m
	 1cfH3Z2WUirhxd3rc6nPIFjIC8Wye87TjTsxhG1yIV11wrCF7AF16lVd6u6jvNXGWZTHF
	 gj7DPuX8tYmPyoT7PZDbpdEhDkFOTfxuGTELuq5aj7ZSVaXm/53kq7ZSQwlcjY0HJzv2H
	 fNJs05M+0qBD8KrqpLY9iynhPnzO3TgFrvwCQsOJ7YjDimEUnEuloJGWaPpeQ+s2ZlIRB
	 PvtR/nIOlvxVPx6JeC+p+DRTlxTF9PE/5jBlnH1vvM9mt4MjrRKEXvjOOXL5iOcy2wA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tylorstech.com;
	spf=pass smtp.mailfrom=tylorstech.com;
	dkim=pass header.d=tylorstech.com header.i=@tylorstech.com header.a=rsa-sha256 header.s=x header.b=1fih5ECV;
	arc=none smtp.remote-ip=136.175.108.221
Received: from mail-108-mta221.mxroute.com (mail-108-mta221.mxroute.com [136.175.108.221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33FB606A32C
	for <regressions@lists.linux.dev>; Fri, 20 Nov 2026 02:52:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D33FB606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tylorstech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tylorstech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tylorstech.com header.i=@tylorstech.com header.a=rsa-sha256 header.s=x header.b=1fih5ECV
Received: from filter006.mxroute.com ([136.175.111.3] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta221.mxroute.com (ZoneMTA) with ESMTPSA id 1a1f6def3f1000d084.004
 for <regressions@lists.linux.dev>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 20 Nov 2026 02:52:49 +0000
X-Zone-Loop: 62d2e0e0b59022b7c14ce552879576f99bc5df479cf8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=tylorstech.com; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	From:Subject:References:Cc:To:MIME-Version:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID; bh=msYeIQlcLBBah1ScNLjcrzC4Z7h2py1hSnX94ae5ztU=; b=1fih5E
	CVYF0iI3fiNq76L3wCq5alYWwCu9aEv7YdZr2Gbwn1WDQXDXZm5S5ieHT27fSt8c7QplB/Et39Vfr
	Pbv+j3n8EEHDinI5kme6ZB2TEFtKzdr4bCI9OIXRpTVvldQ0qKS1mUrKrW38xO59pE0bjS6yoaz0M
	KSDHmBHSK0MbUJMFGiunmYYGs35mUvRilNjleH0je3GNbNiut2/Tjlgfq4JIf1tlRSAkSavxCvqQy
	aEgEa0S+fkUMBkG8BtIggUt5evk1FzIcj0EX5Iltj/r1BHhfxl8nvtafzbgJqt7zLZuaoZ955APou
	pJOIwaLDEBEWsCpkMxVqCrvn/l8g==;
Message-ID: <088fad53-fb61-4513-80da-d0067da5c217@tylorstech.com>
Date: Thu, 19 Nov 2026 20:52:39 -0600
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: regressions@leemhuis.info
Cc: alexander-zorn@gmx.net, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev
References: <3b5586d0-b973-4984-9fbc-43c9ab960d76@leemhuis.info>
Subject: Re: [REGRESSION] Black screen after splash with Linux 7.0 on MSI
 Creator A16 AI+ (AMD Strix Point + NVIDIA)
Content-Language: en-US
From: Tylor Pater <tylor@tylorstech.com>
In-Reply-To: <3b5586d0-b973-4984-9fbc-43c9ab960d76@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authenticated-Id: tylor@tylorstech.com

Hi,

I'm seeing what looks like the same issue on an ASUS ProArt P16 (Strix 
Point 890M + RTX 5060, Samsung ATNA60HR07-0 OLED eDP panel). Panel 
frozen on the boot splash on every boot with 7.3.4/7.3.5; 6.18.60 works. 
System is otherwise up (SSH, compositor running)...

On the failing kernel eDP-1 replay_state is 48 and psr_state is 0; on 
6.18 replay_state is 0 and psr_state is 6. Booting 7.3.5 with 
amdgpu.dcdebugmask=0x400 (disable Panel Replay only) fixes it and the 
driver falls back to PSR. DMCUB firmware is 0x09005700 on both.

Might be worth trying amdgpu.dcdebugmask=0x400 on the MSI to see if it's 
the same Replay issue?

Full details, logs and dtn_log dumps: 
https://gitlab.freedesktop.org/drm/amd/-/work_items/6174

And I saw this issue across multiple distros as well.

Thanks,
Tylor Pater

