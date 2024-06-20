Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5406F27451
	for <regressions@lists.linux.dev>; Thu, 20 Jun 2024 15:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718895662; cv=none; b=Wa04hn/99mtc5TxppJqfCpbsGKkqLhh7+blrYsMTQ6lhQNU5MfLLdNSuqOga6/LfFVPIAEMbTHZRg7zo0hJor4FqvAIE8GlDuVJ1++0CowJf8/PfnDUwhYNE49JvJ5bylQu0vz4o3r7GFv2oQXEuyNcWoBNXUj5pQnuKoJAUxSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718895662; c=relaxed/simple;
	bh=ujhARavDHye1xuXIaMC63ISkDaGPDRG5/Mt916sezr4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=L3+WWXU0EB5KbrMyeO9yApYfnKV0eA7DKEiJv1n89r58D0Gy2G6Kd8suktQJx31ewk9KNXT39gaNf+RkBI/kmkU0tI9B1zvhgjc4jlIIQWznsp4cSF8bI7tVutwxhsLxBF7ljRJ88T2Cqgz3gTWKQ2ykg11Y1ps47faEItK5a14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=axiWmDRH; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="axiWmDRH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=ujhARavDHye1xuXIaMC63ISkDaGPDRG5/Mt916sezr4=; t=1718895660;
	x=1719327660; b=axiWmDRHv3HSP46P/C30JRhmBHcn8SJL1VaJGlRUL26COeRJsInnLAp84a98A
	33E85n+Dsv6iMCZgHL+xIVyOTi3FnQmJ2lJqMqztyS6eJQs5R56B9qaIr0yf/6KpJMQ4WpEyfyMP5
	M0CRXMpayBfTv+RDol1KNFqgu4jVRfpahzH1Lrx2sH2tmOYD+M5MzzH2rAkp2ux8g9E4YAUKHt+RB
	DANJ9rEzBNcyZHhwyPQsauvPF3PkFgY9Wp2xccluHV9sSokKQNXHS3Yf6t28bD4HJTJugBOyQSqGs
	NbJO1GgUobQDn5KUQd6238jxXUHCpQHicWvXaBL1ceEptnnlfA==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sKJHS-0000M7-69; Thu, 20 Jun 2024 17:00:54 +0200
Message-ID: <b6fe4819-766c-482a-b312-f49e8bd79b13@leemhuis.info>
Date: Thu, 20 Jun 2024 17:00:53 +0200
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1718895660;ab503d18;
X-HE-SMSGID: 1sKJHS-0000M7-69



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/845642ff-ba16-4066-aad0-f0d68a47d865@suse.de/
#regzbot introduced: 9eac534db0013a
#regzbot summary: drm/amdgpu: lightdm on Ubuntu 22.04 broken

#regzbot report:
https://lore.kernel.org/amd-gfx/ebb3b35e631169041e70eb0a7efd6cecef609833.camel@sjtu.edu.cn/
#regzbot resolve: problem vanished

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=218961
#regzbot duplicate: https://github.com/thesofproject/linux/issues/5072
