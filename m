Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C192B53399
	for <regressions@lists.linux.dev>; Mon, 11 Mar 2024 16:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710173895; cv=none; b=GrEVSDRvTWVaA12vha/Y9+KrGqnz5/I0ej9RZlcHp4YqXUnsadUsBG5P//Twq/1AGpTdadam9CiehGMilunrsPpsRBbjdv+0hIgpJWcLEQ7HEc+FTe+rwwJ8G1f8JMsEnC9nW6zL0X65BL2hpiMc1IO6vc08WGHB9r0B2WzBTXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710173895; c=relaxed/simple;
	bh=LXG8aNwSaC8k3xcWIsYoqh09m+L/ZhObujU9q7JW0ow=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pW44cYMqqWSNxO8i/sfM63AoRoj9VApYqdXWASmpMl6E/KNtDfLdOmWo1DXhwisbN4zesrvN7z1cHgrPvfQR+OWJvY+BQEsh99TQOrgFAXpV2RfTJCnn6s3xzGvJE9lAGIg1glVGFho+73Z57opqKVVtfUzBz12KSJ9wzHWPOxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=rZQv3Lo9; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="rZQv3Lo9"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	In-Reply-To:References; bh=BQlVn0sfGO/6FRkWMHBIjA018n1pfP/VCDtJm/lkcHE=;
	t=1710173893; x=1710605893; b=rZQv3Lo9NRV85jgsiah5o7NGhWBK2DZVwiiY86mT1Bueucq
	rMZ10zi8RwwVAtn/ChIdcbeZWaXjpGCucGFeqqXL9lkNiFPZGoPZh5+mzsuMofVXHCfAVeIP6ncC/
	TODzExLFgnkS+pwnw6ZvuHbtXGAJLuAeQV7Ej9EQFuMqLeJRPxrdtq2bpTMF6I5DW/eOT+Di9L/4G
	OWOSYIApNYl+pSrFKCzyz58qIA+CMqR99Y4Giy/DQmGq98GlDuS2HFM/wsCEjUa0Su8A3sO134e3j
	QbKllL2yY4hR72uv8MJ8aqZMGPPFzTt5ufYDvjRBSy0fc5fx3QylOcaNn8V1smNw==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1rjiLo-0000Fx-4Z; Mon, 11 Mar 2024 17:18:08 +0100
Message-ID: <fc215679-e5f8-4d1e-bd70-c940d40a01e3@leemhuis.info>
Date: Mon, 11 Mar 2024 17:18:07 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Fix divide-by-zero on DP unplug with nouveau
Content-Language: en-US, de-DE
To: imre.deak@intel.com, Chris Bainbridge <chris.bainbridge@gmail.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 lyude@redhat.com, ville.syrjala@linux.intel.com,
 stanislav.lisovskiy@intel.com, mripard@kernel.org,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <ZcfpqwnkSoiJxeT9@debian.local>
 <Ze8suV5ox+43/wAC@ideak-desk.fi.intel.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <Ze8suV5ox+43/wAC@ideak-desk.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1710173893;1aea2aa5;
X-HE-SMSGID: 1rjiLo-0000Fx-4Z

On 11.03.24 17:09, Imre Deak wrote:
> On Sat, Feb 10, 2024 at 09:24:59PM +0000, Chris Bainbridge wrote:
> Sorry for the delay.

Happens, thx for looking onto this!

>> The following trace occurs when using nouveau and unplugging a DP MST
>> adaptor:
> [...] 
>> +	if (bpp_x16 == 0)
>> +		return 0;
> 
> Could you please move the check to the beginnig of the function and add
> a debug message in case bpp_x16 is 0?
> 
> It looks odd that a driver calls this function with a 0 bpp_x16, and
> ideally it should be fixed in the driver. However as it's a regression
> and we don't have a better idea now:
> 
> Acked-by: Imre Deak <imre.deak@intel.com>

Chris: as this went into 6.8, please consider adding a stable-tag to
ensure Greg picks this up.

Ciao, Thorsten

