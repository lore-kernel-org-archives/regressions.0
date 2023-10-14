Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD34125B0
	for <regressions@lists.linux.dev>; Sat, 14 Oct 2023 16:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FUlmydet"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DBD0C433C7;
	Sat, 14 Oct 2023 16:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697301576;
	bh=KMnJhorsnSWz5/7BlQOX6Zikw83Hl9vuJV1gG65YlOk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FUlmydetFqtHuStINlBONXkFH4arANnAtY+p118N/Zd9xNjP+0Wz3zLNIgAiZ0fcs
	 sAdz3en4vqYCeH1BvFFBFs4+yQm3oVt7+JYEoOVp/+rz8eeVqFJSHm4oMP7bk0De6U
	 2qrH2q4RqsEcMwL5ZTIhyNn2Cv8KefweVUNgoYWYX7jPrisM656LcuTFn1UkQD0B2C
	 SvmZWcNgSx3CyVweFKzWVDL+oLOXImvXBl+6+zy7nfF+0g3V0+MSfgX+yjY4drV6PE
	 OZy8Wn3J5TmPbRpn5lbJY19G6HeV3QiwAzeUp9OP383DQrkDK+lbsNdNozTC72TGA2
	 Hu6GTMFVdodHA==
Date: Sat, 14 Oct 2023 12:39:35 -0400
From: Sasha Levin <sashal@kernel.org>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Marek Vasut <marex@denx.de>, Linux Stable <stable@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	Dinghao Liu <dinghao.liu@zju.edu.cn>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mark Brown <broonie@kernel.org>
Subject: Re: Possibly broken Linux 5.10.198 backport spi: spi-zynqmp-gqspi:
 Fix runtime PM imbalance in zynqmp_qspi_probe
Message-ID: <ZSrERw6ucvl1wLWX@sashalap>
References: <9afe9285-6f46-46d9-bd21-2ea5c4dc43c0@denx.de>
 <ZSjYC_ATX193mJOA@debian.me>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <ZSjYC_ATX193mJOA@debian.me>

On Fri, Oct 13, 2023 at 12:39:23PM +0700, Bagas Sanjaya wrote:
>On Thu, Oct 12, 2023 at 06:39:10PM +0200, Marek Vasut wrote:
>> Linux 5.10.198 commit
>> 2cdec9c13f81 ("spi: spi-zynqmp-gqspi: Fix runtime PM imbalance in
>> zynqmp_qspi_probe")
>>
>> looks very different compared to matching upstream commit:
>> a21fbc42807b ("spi: spi-zynqmp-gqspi: Fix runtime PM imbalance in
>> zynqmp_qspi_probe")
>>
>> The Linux 5.10.198 change breaks a platform for me and it really looks like
>> an incorrect backport.
>>
>> Dinghao, can you have a look ?
>>
>
>Thanks for the regression report. I'm adding it to regzbot (as stable-specific
>one):
>
>#regzbot ^introduced: 2cdec9c13f81

I'm going to revert it from 5.10.

-- 
Thanks,
Sasha
