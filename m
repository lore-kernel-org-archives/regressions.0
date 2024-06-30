Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5BF42AA9
	for <regressions@lists.linux.dev>; Sun, 30 Jun 2024 10:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719741714; cv=none; b=T3XLxpC6zZaY7zuj9ni9UMcqISAM2kbWTVCoBvfEnEWFt5Dx8TBoed/WgTvtjNSViSDgoptGWbCqcgPY328GecEmss5WcmhmuM/c/8DPp9oKNpO05hLxiP/rv5U29iZ8ANxRz53M+H9oSAuOcvhnv6WO9w4SyzSl9XddomLLogc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719741714; c=relaxed/simple;
	bh=M8CNLowCG0pyurU9Ne+3PEfu07YNNDJCmGsq18NoByI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=qjWchshR7h2Gax2lP0qtgv237HtGFxQiz0NbwidSj4GCwEcB3exbdKvOzoKypJukUkY3cqbUAZkVn0Qy4DsC4pAHGYtKAqUd8JWPRdZ5dc9M9dCnjxqSy6pXodjzDk5pFPrMgqiVLIai7kWPlXMZuqXRkU/2OFREtzkrZNRAkcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=LWBA803y; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="LWBA803y"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=M8CNLowCG0pyurU9Ne+3PEfu07YNNDJCmGsq18NoByI=; t=1719741712;
	x=1720173712; b=LWBA803yb60TdaVHCztkuAyqDPhMyWxkiybBgFevog7E+3IoiKZDb8hQiMnFQ
	80mildbs2RdfZ+9UzL4dOFTH+HbnO9Ven0nVV34XV1sEx8agXqAlWRxKKItGJhiDStv3+q/jAy4sj
	tulaBmeA55r850UunmgUqhbIe7cqjEbhVdrvYNvHzNcGYOOvFCvINz7AkDEqI5sYf0VMwb9x3dMx0
	2yZtVRtsnaQqIR/Qijl0XL21n8jPxNcoIf1xbpakkWffwcvPq5OdRzP6wDOHTSzt1hdGNO6eVYSvE
	wpJPy/FmQ19G9qjKZtAiHAFTd0fseg2g6LW61csjuMahZzwKHA==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sNrNP-0001r8-SH; Sun, 30 Jun 2024 12:01:43 +0200
Message-ID: <be6039dc-58a9-4e22-bd46-caed136460db@leemhuis.info>
Date: Sun, 30 Jun 2024 12:01:43 +0200
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1719741712;e36a8d7d;
X-HE-SMSGID: 1sNrNP-0001r8-SH

On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/dc1e6cba-352b-4c78-93b5-94dd033fca16@linaro.org/
#regzbot introduced: 202aa0d4bb53
#regzbot summary: thermal: core: trip points crossed not detected when
no cooling device bound
#regzbot fix: thermal: core: Call monitor_thermal_zone() if zone
temperature is invalid
#regzbot monitor:
https://lore.kernel.org/linux-pm/2764814.mvXUDI8C0e@rjwysocki.net/

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=218961
#regzbot summary: ASoC: SOF: Intel: Lenovo Thinkpad X1 Carbon Gen 10
first S2idle fails, S0ix fails in all further suspends

#regzbot report:
https://lore.kernel.org/lkml/20240617193408.1234365-1-stefanb@linux.ibm.com/
#regzbot summary: tpm: init of TPM chip fails

#regzbot report:
#regzbot fix: kbuild: Use $(obj)/%.cc to fix host C++ module builds
#regzbot monitor:
https://lore.kernel.org/all/20240624-kbuild-fix-xconfig-v1-1-7c06eae6d3aa@avm.de/
