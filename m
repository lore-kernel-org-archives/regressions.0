Received: from s1.g1.infrastructure.qtmlabs.xyz (s1.g1.infrastructure.qtmlabs.xyz [107.172.1.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9C517597
	for <regressions@lists.linux.dev>; Fri,  4 Apr 2025 02:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=107.172.1.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743735276; cv=none; b=DmTJJUj0DwNPiNS6CEqyZ/t9mhdRC+vRuOBGqCHo2fvAGXcwKuFo3FxFqSmTxKYoSu3/8BFq9mGNrlTHaBgE6X9+rK5IA5fzaDeT3G571gq7DEdc2q41o46/Z4rS3UWcpMRDMBD9PQC9ThObmxstf662eYtOfog15KszAv8oF9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743735276; c=relaxed/simple;
	bh=o2Qp7noUEdgvbjneRbum3By4oKTUc48b2NdBMWJD2gQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TEtwU50K7Vnz/0r7cDvTGwNhSPMNguQmIt6mjv0d721tkZ58H9+CgszuEi5LYuJW6o/8rj39mzVD7D2d0G8itNFZgghAOuyIlAskGE9L91FNKp3kmyS+Jdr6wXjGhWprwbCXSnspspyZYbsudGS64yevfVm6K8HnTIgl1dVW+RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qtmlabs.xyz; spf=pass smtp.mailfrom=qtmlabs.xyz; dkim=pass (2048-bit key) header.d=qtmlabs.xyz header.i=@qtmlabs.xyz header.b=YU3bBWRA; arc=none smtp.client-ip=107.172.1.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qtmlabs.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qtmlabs.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qtmlabs.xyz header.i=@qtmlabs.xyz header.b="YU3bBWRA"
Message-ID: <691be719-7d4c-4cb1-87d6-cca7834547fe@qtmlabs.xyz>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qtmlabs.xyz; s=dkim;
	t=1743735263;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vqgQZ33wcq/hpv8n+1Ly9smcoDQEdPOPf9R8b9HYxu4=;
	b=YU3bBWRAz9g85BvWK1a7ViAWfYuYZn9JzeI14o9bsJF8Z0lDQ42Qfwd1o9TbrktO7M28C8
	6zVnmzA5A183utZkTS1dyP9rcvRhVjSo4bDTT3+spyroG2PgnXwdfVGlCjCp1VrPVCNfn6
	iKrgIB1hD35/HMnEZr8Xvi3q2IsDQeHZ2WfU0UldEqzGK+F8WN3A0g65EEOUJ5+7PhFPVP
	TdrxVVOk+cJDCuF+YqhZHlyQWAmCH9Ehh8lTA7OTr5/1Llv7R0v1phLKbGGbtiLpZvNlAv
	WHqcFRl33vxRUaEJ6AR5qzSs3zOW7rInO21s/J6pLGfal9OeJdagSDG0QDgVVw==
Authentication-Results: s1.g1.infrastructure.qtmlabs.xyz;
	auth=pass smtp.mailfrom=msizanoen@qtmlabs.xyz
Date: Fri, 4 Apr 2025 09:54:16 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [REGRESSION] Kernel booted via kexec fails to resume from
 hibernation
To: Roberto Ricci <io@r-ricci.it>
Cc: ebiederm@xmission.com, rafael@kernel.org, pavel@ucw.cz,
 ytcoode@gmail.com, kexec@lists.infradead.org, linux-pm@vger.kernel.org,
 akpm@linux-foundation.org, regressions@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <Z4WFjBVHpndct7br@desktop0a> <Z4WGSMdF6seQm9GV@desktop0a>
 <b9f6ed5a-74b9-47c0-b073-9922dbe6119b@qtmlabs.xyz>
 <Z-8E-LLs1dFWfn6J@desktop0a>
Content-Language: en-US
From: msizanoen <msizanoen@qtmlabs.xyz>
In-Reply-To: <Z-8E-LLs1dFWfn6J@desktop0a>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Bar: /

Can you send the dmesg logs for this case (6.13 + mentioned patch series 
backported as target kernel, using kexec_load)?

On 4/4/25 05:00, Roberto Ricci wrote:
> On 2025-04-01 19:59 +0700, msizanoen wrote:
>> [snip]
>> It seems like `e820__register_nosave_regions` is erroneously marking some
>> kernel memory as nosave in the presence of sub-page e820 regions. In theory
>> backporting
>> https://lore.kernel.org/all/20250214090651.3331663-1-rppt@kernel.org/ should
>> be sufficient to avoid this but a fix for the actual root cause is
>> preferred.
> When using kexec_file_load, this patch series fixes the issue not only
> in theory but also in practice.
> But the issue with kexec_load (see
> https://lore.kernel.org/all/Z-hYWc9LtBU1Yhtg@desktop0a/
> ), which might be related, is not fixed.
