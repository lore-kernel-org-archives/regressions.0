Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D1270832
	for <regressions@lists.linux.dev>; Tue, 12 Nov 2024 12:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731416385; cv=none; b=TjM9PnuHhaAATaSecuDYcQW0PJelamJbpL8RmRs0nsr9EPdXPB70/eVgQZOnZ+p0xh9mXaVVka6b6CU/8spnD1+cLqvU2Eb2tOqRnsz0f1w0U4kaY19TxdvaDf24GfTGNw4c9ku6xg+MF3CKsbu05eSO3GCXZAAjxjOUnYQ13ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731416385; c=relaxed/simple;
	bh=FS9743yTb08QPx7OYTrpJp942turPyAuxKTsJuWfz9A=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=dV9FjdMEffVluDx5leFQ0UWTzejoSQ4tC03Mew6b37HQfpyb0IrfTrs2ePQb1Z0ECxX/W7xL+eaDvJ4MxrRmuF1t99IYXJKSTzCOd9WO+TEHGzWgLw/4QHXOHxL+ggqm7VrSAUPBBRnd/mYOhhYt04WuEH9/9KkGWehU0puwGOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=gZsBCe+n; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="gZsBCe+n"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=FS9743yTb08QPx7OYTrpJp942turPyAuxKTsJuWfz9A=; t=1731416383;
	x=1731848383; b=gZsBCe+nHQ7dz3PRSUfzfldxfk2+vGqtHD73gjH5S3HNqgLAvcfmhGkr7CtHv
	4InnCigNg3+x2VqQWkcefE8B17pRKo6GUARHg51iO2csMYgvs1WLHX5IdAYOyPJ8Xdd9r0XLqqKMz
	CjCuNkZdesPHs6qO2vxI89cT0u8AhYhcTvA6ui+1YBgGhQU7KlrJbLmdf52gnJOPqXrSrqvrV9JfL
	XdEUzpzBgyNVG0eTCXnN2pOJ+qlI96BO3Yq46Xst8/i/rp3alM5k3Z0mHTXnTIhhMhMzs34+s9Urk
	wLnGsmUEZcrLnpo8v7YOnrXnQoDdh/Ib2eijL7Oktjyho6imOw==;
Received: from [2a02:8108:8980:2478:87e9:6c79:5f84:367d]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1tAqUf-0001Dv-I4; Tue, 12 Nov 2024 13:59:41 +0100
Message-ID: <697b421a-5b9c-41ff-98a2-c0f47998615c@leemhuis.info>
Date: Tue, 12 Nov 2024 13:59:41 +0100
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1731416383;aea33223;
X-HE-SMSGID: 1tAqUf-0001Dv-I4



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/Xw3BDSu6nGp8D43shw707_3JcIzRhictWhTjZpThlOWIyF69jtxhq11eV2ExaObroqAhGypRaS86DmN2f2e2IgmGSC4U1AFRW95qOLometo=@meirisoda.online/
#regzbot introduced: v6.10..v6.11
#regzbot summary: ability to switch power modes gone

#regzbot report:
https://lore.kernel.org/all/CAJpMwyjmHQLvm6zg1cmQErttNNQPDAAXPKM3xgTjMhbfts986Q@mail.gmail.com/
#regzbot introduced: v6.10..v6.11
#regzbot summary: mdraid5 hang and CPU lockups

#regzbot report:
https://lore.kernel.org/lkml/20241010133253.30311-1-diogo.ivo@tecnico.ulisboa.pt/
#regzbot introduced: 9b340aeb26d5
#regzbot dup: https://gitlab.freedesktop.org/drm/nouveau/-/issues/391

#regzbot report: https://gitlab.freedesktop.org/drm/nouveau/-/issues/388
#regzbot introduced: 9b340aeb26d50e
#regzbot summary: nouveau: boot hang after grub selection


