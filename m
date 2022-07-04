Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47A792C9C
	for <regressions@lists.linux.dev>; Mon,  4 Jul 2022 12:49:57 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AFA5D23A;
	Mon,  4 Jul 2022 05:49:56 -0700 (PDT)
Received: from bogus (unknown [10.57.39.193])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 48AA53F66F;
	Mon,  4 Jul 2022 05:49:54 -0700 (PDT)
Date: Mon, 4 Jul 2022 13:48:43 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: open list <linux-kernel@vger.kernel.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	lkft-triage@lists.linaro.org, regressions@lists.linux.dev,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Catalin Marinas <catalin.marinas@arm.com>, huhai <huhai@kylinos.cn>,
	Raghuram Thammiraju <raghuram.thammiraju@arm.com>,
	Mark Brown <broonie@kernel.org>, Olof Johansson <olof@lixom.net>
Subject: Re: next-20220704: juno-r2: Unable to handle kernel NULL pointer
 dereference at virtual address - scpi_send_message
Message-ID: <20220704124843.nu5jvdomxwwry35g@bogus>
References: <CA+G9fYu0CajqiX5bQq-zmp1rpOW2eniH=fcPaJA+Wwi_XmKCWQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYu0CajqiX5bQq-zmp1rpOW2eniH=fcPaJA+Wwi_XmKCWQ@mail.gmail.com>

Hi Naresh,

On Mon, Jul 04, 2022 at 05:23:53PM +0530, Naresh Kamboju wrote:
> [please ignore this if it is already reported]
> 
> Following kernel crash noticed on arm64 juno-r2 device while booting
> the Linux next-20220704 kernel.
> 

Thanks for the report. It is just me not pushing the right version of a
particular patch. I will update it after testing once again.

-- 
Regards,
Sudeep
