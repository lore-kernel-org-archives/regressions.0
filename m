Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8254D1C8FA6
	for <regressions@lists.linux.dev>; Fri,  6 Sep 2024 12:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725625328; cv=none; b=MNRodr69ncUcG96pUma3/agVMpW9sW2EnbRjejKL+vGojEF26LEuT3HvYrjODoTN/yzO+FcxHFmlRBRlrRUndnlfbzyMn9ZNa3i56TlMzQywWaWfL3wkLdNVN+fD9B+rbjRYIyzkpeCudTSgk0kfpu+nFzjs06Akws4LwQirUlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725625328; c=relaxed/simple;
	bh=jWyIwkhjUDCcaQ6XqpX3w43pxgDmfx+DO2s/yqjBrMk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=Ry/ijRBjL8yV0Yn22fkqWSIiAdRh7CK5LhfUj+dbi0cENBwpTsHoZiNmqJf9ufg6rFAHPHWpQVCtJv9NCtDzQfiULs0xaU0M/eH5cu8COSmfPbEoJbldb+/nV+0q90JyMiz634B3PIwcPv/aDMmux+cvWc/iPyMqEaWDr4O2fG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=o5ZE6nym; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="o5ZE6nym"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=jWyIwkhjUDCcaQ6XqpX3w43pxgDmfx+DO2s/yqjBrMk=; t=1725625326;
	x=1726057326; b=o5ZE6nymr8nUBkoocNxM+mo5Lbpvmhv059BtpZ2ydQ7kkF4g0+FJ0ygXweq6y
	qJR4Izxq8oRqjkWDonxZE8sdLLxEVkGBbW2XHPBf5uPUtDph2YnMv+RVs3kvKKcozGZhytAywUCPJ
	6oaHh6igdliAoKP6M9aXbbnWnT29k1iqKnc0A13sCuAm2Jcn/U4RN1VE2NpIJHAIp21beflwWWTkl
	OeeSXEhWCb/WJZyI8906Srn7lvP+NehRn1BGz4PzDY/GenmeR81qbCM8Q0GnMBQY/hmuWX5YVXynB
	dnDfnhBzjMl9PG7CZV7oatqmCBkXtBgeU3Yx0T141XIlHoERvA==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1smXyW-0001TA-Nq; Fri, 06 Sep 2024 14:22:04 +0200
Message-ID: <2695f022-5878-4166-ad3e-5b73d5030eb5@leemhuis.info>
Date: Fri, 6 Sep 2024 14:22:04 +0200
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1725625326;bb22c4ac;
X-HE-SMSGID: 1smXyW-0001TA-Nq



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/lkml/d6392b1af4ab459195a1954e4e5ad87e@viasat.com/
#regzbot introduced: 13a71384ae6a8779da809b00c6f378dcead10427
#regzbot fix: cpufreq: amd-pstate: Enable amd-pstate preferred core support

#regzbot report:
https://lore.kernel.org/all/CAH2r5mtNqn0i5NQSQvMvbHDdRDJxcNQh7iTj76L=90kEhDA7iw@mail.gmail.com/
#regzbot fix: 27ce65f65258

#regzbot report:
https://lore.kernel.org/all/pv2lcjhveti4sfua95o0u6r4i73r39srra@sonic.net/
#regzbot fix: c26096ee0278c5

#regzbot report:
https://lore.kernel.org/lkml/CAMi1Hd1KQBE4kKUdAn8E5FV%2BBiKzuv%2B8FoyWQrrTHPDoYTuhgA@mail.gmail.com/
#regzbot fix: clk: qcom: gcc-sm8550: Don't park the USB RCG at
registration time

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/issues/3603
#regzbot introduced: v6.10..v6.11-rc1
#regzbot summary: drm: amdgpu: screen flickering in games

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/issues/3569
#regzbot introduced: 38e0c3df6dbd36e69d38f67853cdd1bb6110
#regzbot summary: drm: amdgpu: certain operations are much slower

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/issues/3519
#regzbot introduced: b7a1a0ef12b81957584fef
#regzbot summary: drm: amdgpu: massive stuttering when GPU is almost
100% load

#regzbot report:
https://lore.kernel.org/stable/d74a7768e957e6ce88c27a5bece0c64dff132e24@holm.dev/
#regzbot dup: https://gitlab.freedesktop.org/drm/amd/-/issues/3513

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/issues/3588
#regzbot introduced: 8bd82363e2ee
#regzbot summary: drm: amdgpu: ASUS TUF A16: RX 7600S falls off the bus
