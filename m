Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE9579B6F
	for <regressions@lists.linux.dev>; Tue, 12 Mar 2024 12:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710246453; cv=none; b=FzKf9905JU5h3d8dfuR44OMzrfiy1zfoyXQ1CgOPTzbyZqWtRj6EWVRSm6ArMHF0BjDTOU5gGb2C48oKnTCTfGW0u6WLJQCLjxHd6xe0XehHuoFx3JguLSIoG4pteRKiaR21PuQrUdfNFyjF+gqS+TQCFoRc6qF0U3DOJdurvWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710246453; c=relaxed/simple;
	bh=bzTrgr9ZRKXLb8iOggCN4C+1FgnhB9lh2xhl04/QGaE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=VACTBhvmrYR6WVHIdeWh6l3952O0wzPJLzHjENYIYCYd2A6qYR6UEVGwAUBvUnmmqLxrRtfVAhkDXbXIwZX/9EO6LaGRj1DA/iAFplQUh+XwvwYLXZvDTBTKjrrXxyxpnc3Rwu7JX9ZfGk2Hc8jrJQIASDJN7vx0mJ++4ERuK8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=GmwCvkzE; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="GmwCvkzE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:
	From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=bzTrgr9ZRKXLb8iOggCN4C+1FgnhB9lh2xhl04/QGaE=; t=1710246451;
	x=1710678451; b=GmwCvkzE1NryS5wZv8/G6tveGyPR+QguW1QbciPqvLNuDp8JJZYygc10MOBWh
	LPlfRsPG2sZIZF2iHoM4p088AxQg3kdJbvuTB5qjteFz7cmMAOiOwCpK4JCP8Z0Nkee/eUxA6QFPO
	QNu1vc13nllaeGhpK5TigC/sdIE9GsmYXReid5xGRhDJ1BFPH4aXWlOCImsOM4TABWMAPIwtseBFm
	S3hUre+nAfiboEzfgann6x+sZbWrJ3GertlUBBmv658sjriapnrlTEspkJ5oXuhFZ/PKPYadoN/MG
	8QXqrooSMdNQZ1VG9wTZt7XMzkAmDe0847FKC3ywH7ibt1odBA==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1rk1E9-0004np-Dk; Tue, 12 Mar 2024 13:27:29 +0100
Message-ID: <c7cea06b-682d-433e-92dc-35f714e743e7@leemhuis.info>
Date: Tue, 12 Mar 2024 13:27:29 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Thread for updating minor properties of tracked regressions
 [consider ignoring it!]
Content-Language: en-US, de-DE
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: Linux kernel regressions list <regressions@lists.linux.dev>
References: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1710246451;40b8c196;
X-HE-SMSGID: 1rk1E9-0004np-Dk

#regzbot report:
https://lore.kernel.org/dri-devel/20240229175822.30613-1-sidpranjale127@protonmail.com/
#regzbot fix: f6ecfdad359a01c7fd8a3

#regzbot report: https://lore.kernel.org/lkml/87a5v8szhc.fsf@mutex.one/
#regzbot fix: c95a2a0be0b1bb

#regzbot report:
https://lore.kernel.org/lkml/20231229002623.GA1560896@bhelgaas/
#regzbot fix: f93e71aea6c60ebff

#regzbot report:
https://lore.kernel.org/lkml/20240110190021.GA2113949@bhelgaas/
#regzbot fix: 41044d536068

#regzbot report:
https://lore.kernel.org/dri-devel/7c50e051-eba2-09fc-da9f-023d592de457@ristioja.ee/
#regzbot fix: d1b163aa07497

#regzbot report:
https://lore.kernel.org/linux-scsi/bug-217599-11613@https.bugzilla.kernel.org%2F/
#regzbot fix: c5becf57dd5659c6
