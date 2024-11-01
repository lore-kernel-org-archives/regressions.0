Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D4E1714D3
	for <regressions@lists.linux.dev>; Fri,  1 Nov 2024 14:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730470983; cv=none; b=jDVE2xWRXFnzNGxwE0phe+q83BSy23z3VTPhyQsxOXfDv3s5ewjsRRRXade5rthbZ2UZZiwU5cIkDOPpHUWL3LTF6ucmVWTYAmOkL0hBF/XupQ7gHOjE3B+MVXbPEWsDPj71Q7n3AMQFTKnrbay+fVgL6uKMqrQSpqACKSDuieY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730470983; c=relaxed/simple;
	bh=QHRRBESYVtFKBS/z1r14L0kA5KOjxpVo/GaILD92cTI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=gz9ao1smlZaSZqG1OC6U4/Bw7PczrRXE17fMSs9ptnUw4iE2A5NqIquzu8XRizhqs1IP1nBXZ8ICDrGCbzNazlTVmfm9gJD9gGTv/+DVhBd+EEfHRKRZcbXymVQ0MZx8TOKYOkfzsBI+2qZiJjDBwIMuIcJTDktgpqZ4ec9snIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=WwMCzwTe; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="WwMCzwTe"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=QHRRBESYVtFKBS/z1r14L0kA5KOjxpVo/GaILD92cTI=; t=1730470981;
	x=1730902981; b=WwMCzwTe7QHy+tjMJudpMIFxIFeNCv9+6/pgdXuhMJirnecbhGWMOl2ywnstS
	MmFjD+AwjvUz9h+rMib8088J8UeE1qCosUqwqrw89p3BHpESExMG4tyVoae/vCyxjSWI1x5nSvNUT
	aFIjhKpeDlBjOBsGWGdmMnrylMsfmHju/wtmFDWLR62KlZ2+BrJ73eOgse5gler4sk9bqTSsBurLh
	BEHpG2VKW2OjUl3gDKQPQdXOEgjY+PcLMcAMX5SNWOD+YTEybuHYImGEvFtOGjeN97Pk4lftQYKRF
	cpNCQt6Ue/zS8sGx7hUfQXYg5KhlSmDpGkc+Jorx9chF4JdMSA==;
Received: from [2a02:8108:8980:2478:87e9:6c79:5f84:367d]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1t6sYF-0003ag-B2; Fri, 01 Nov 2024 15:22:59 +0100
Message-ID: <513045fa-bf4b-4e80-8bd7-144430220e80@leemhuis.info>
Date: Fri, 1 Nov 2024 15:22:58 +0100
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
Content-Language: en-MW
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1730470981;dcea6a5e;
X-HE-SMSGID: 1t6sYF-0003ag-B2



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=219447
#regzbot introduced: v6.10..v6.11
#regzbot summary: net: wireless: iwlwifi: Wi-Fi does not work after
waking from sleep


