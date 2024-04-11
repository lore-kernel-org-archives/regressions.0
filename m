Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B09B5337F
	for <regressions@lists.linux.dev>; Thu, 11 Apr 2024 17:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712856433; cv=none; b=nVx3sDUYxeOZZdGX9t2eRTu4I+9YyVlp1pPxD5FQVcetkH8S8DP8on8Th2OxdqBQ5OE3an8kn56q9btkKHQNTTeOJmz0t++ENufCUbMQlO3H8+Xk2xZkFZIG9Dzj3t1sfSJkW1n0QV2bk7RnmQAkSTYxHQVf3HYQE177cJj1jb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712856433; c=relaxed/simple;
	bh=8jp+YSY+qwa8X5tBAJNMXlYHTgTPm51nlqWJpub33+o=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=jujA/Tumd/POgw4hTw6gzMZJheYAv1NEEHC/cmYlX8yt/IdlVvKTL6CDrEipwtHVzzQhhMFtv/CLsSYmXcGzzpaOZD4BAytNx3NI2nczmfW1xhVG7Cezkb7zpg6cyrAIK0r2zkMeF6zIXkiQjgV33LEWRURUOS2uCvnUjz4YTfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=CHLu2qOo; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="CHLu2qOo"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:
	From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=8jp+YSY+qwa8X5tBAJNMXlYHTgTPm51nlqWJpub33+o=; t=1712856431;
	x=1713288431; b=CHLu2qOouHBn5sc0qgKQaZjTLZhJXTnm4Hq+7XEG0f7vHJMynlvdMJivUMGhQ
	UWKCLjO0TUSfVOO8NFCPxOcu8SwC/Fy8Bf/GPfd92ZFT4Syf4XC33Xs18Z4EKURBHgokvyVQ9r2GN
	T8C8kbg4GkNrpBOjDpc1nEMkYbmzmjSxpnpypcry4WGm7QyifNV2XKvbIDw6XTHLNWt95A+KgARFg
	2ZDWi5QXDMSUHzWAw1zfH3DoKb6FACcw5gAHQj4AXn38yVH4L/UW0DvFpDoFLLiOXEq00hSxZQeIv
	b/T0PNkhGUu8lgjwV2e9iS6UcxGBerj7vcDz0ZDvNvDOps5n9Q==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1ruyCa-0004n0-SF; Thu, 11 Apr 2024 19:27:08 +0200
Message-ID: <36a9adcb-d18c-4e47-9da2-368b6134d773@leemhuis.info>
Date: Thu, 11 Apr 2024 19:27:08 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Thread for updating minor properties of tracked regressions
 [consider ignoring it!]
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: Linux kernel regressions list <regressions@lists.linux.dev>
References: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Language: en-US, de-DE
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1712856431;0b52dfc0;
X-HE-SMSGID: 1ruyCa-0004n0-SF



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/9efbd569-7059-4575-983f-0ea30df41871@suse.com/
#regzbot introduced: 59cf4457545669
#regzbot summary: USB: core: enumeration problems with one particular device

#regzbot report:
https://lore.kernel.org/all/20240410193207.qnb75osxuk4ovvm6@mraw.org/
#regzbot fix: scsi: sd: usb_storage: uas: Access media prior to querying
device properties

#regzbot report:
https://lore.kernel.org/linux-pm/20240318191153.6978-1-corngood@gmail.com/
#regzbot fix: 5864e479ca4344f3a5d

#regzbot report:
https://lore.kernel.org/stable/22aa3878-62c7-9a2c-cfcc-303f373871f6@quaintcat.com/
#regzbot resolve: firmware update for dock fixed this and that's okay
for the user; not ideal, but let's wait for more reports

#regzbot report:
https://lore.kernel.org/linux-arm-kernel/mvmcyt13idm.fsf@suse.de/
#regzbot fix: 7a29fa05aeca2c

#regzbot report:
https://lore.kernel.org/lkml/CAOCpoWeNYsMfzh8TSnFqwAG1BhAYnNt_J%2BAcUNqRLF7zmJGEFA@mail.gmail.com/
#regzbot fix: b25b8f4b8ecef0f48c05f0c3572daeabefe16
