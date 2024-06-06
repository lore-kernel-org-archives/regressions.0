Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3832B17E8EA
	for <regressions@lists.linux.dev>; Thu,  6 Jun 2024 10:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717671478; cv=none; b=JNZPMCxg3gHAAXe+3ngDCAj47dQZdmSo6+YN5IifteDJzCXSppu+EWgvW0K5GOe2WXauLw0bd8SUAMP5ZPtlW7sXa+40+H90QIphxKBW/Xid4gEVKiJNoO+gx1AtLV5u6PwiSt7AdQDr59SVVHsCVJd+MqJtraa9KivI9edDOUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717671478; c=relaxed/simple;
	bh=lcXvnagJ8bN97tmuQ0FhMexyqz12GNzktEQbVhn6diE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=se6tX7vs415ZFn7rTDgB71toayumWD5tfF8XRDx6q2oN3in3hZbPsSYBTAqh/EZdI8krfoQwn+9l01Tugkl0zV6QAASvpCyjEQHHk13aCqWyvID+p7HGg2SntrWg5x1CYENalz/TDyRQ7HYDtVZ51qRr2AP0szWu1okhmtuDkZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=DTCFEXnc; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="DTCFEXnc"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=lcXvnagJ8bN97tmuQ0FhMexyqz12GNzktEQbVhn6diE=; t=1717671476;
	x=1718103476; b=DTCFEXncCXVj6wh6ETPooOY5Du2vSy7uZZ76VoUvQxms2305wW0nwbPcMRod0
	4w3J964SIRTwx/FBhtPZu2veSJbeMId5pp0nrqZrTNLFZ05ATIPYSPSSKijnygWZmXExn9JGTuqfm
	iVNTq0IHyEgBDgMjSyH7fUXbiYCQMAMC1vz1DQVgCo8G4ItgxZxLI9zxGGkMMI0TMrq4h+KUI5yjx
	8/8hx/s9k3wNq+QfoJdyL1QzD6c+cJSv4upcV7GM+ssBvJdjIsnWjj6LHm4FppeIb0wO3NoUanQI/
	SbUdWjAQzlYsqSj6ZG36adMqT4m9NM56UeDaNW/F6rMkATI/vw==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sFAoc-0003qr-4B; Thu, 06 Jun 2024 12:57:54 +0200
Message-ID: <1a76766d-61f8-4a29-93ad-40fdf1e83a61@leemhuis.info>
Date: Thu, 6 Jun 2024 12:57:53 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Thread for updating minor properties of tracked regressions
 [consider ignoring it!]
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: Linux kernel regressions list <regressions@lists.linux.dev>
References: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Language: en-US, de-DE
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1717671476;de4dc8a7;
X-HE-SMSGID: 1sFAoc-0003qr-4B



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/lkml/75c17881-68e9-40e7-821c-5655d49d7c0f@redhat.com/
#regzbot resolve: apparently plymouth bug maybe triggered by some timing
changes on the kernel-side

#regzbot report: https://lore.kernel.org/all/Zj0ErxVBE3DYT2Ea@gpd/
#regzbot duplicate: https://bugzilla.kernel.org/show_bug.cgi?id=218916

#regzbot report:
https://lore.kernel.org/all/DS7PR12MB57665F9F4BDF0598D7CC53DD94FF2@DS7PR12MB5766.namprd12.prod.outlook.com/
#regzbot introduced: b33651a5c98dbd
#regzbot summary: drm/qxl: VM graphics often malfunction after boot and
sometimes shutdowns occur

#regzbot report:
https://lore.kernel.org/all/3d77cb89857ee43a9c31249f4eab7196013bc4b4.camel@redhat.com/
#regzbot resolve: a BIOS update resolved this
