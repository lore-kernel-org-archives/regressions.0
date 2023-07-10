Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39BBB125CA
	for <regressions@lists.linux.dev>; Mon, 10 Jul 2023 16:52:53 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qIu83-0003mt-VT; Mon, 10 Jul 2023 18:52:52 +0200
Message-ID: <9dfca68e-525e-9df5-a7d0-2e2ce6de9bfc@leemhuis.info>
Date: Mon, 10 Jul 2023 18:52:51 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 1/2] tpm/tpm_tis: Disable interrupts for Framework
 Laptop Intel 12th gen
Content-Language: en-US, de-DE
To: Christian Hesse <mail@eworm.de>, linux-integrity@vger.kernel.org
Cc: Lino Sanfilippo <l.sanfilippo@kunbus.com>,
 Linux kernel regressions list <regressions@lists.linux.dev>,
 Peter Huewe <peterhuewe@gmx.de>, stable@vger.kernel.org, roubro1991@gmail.com
References: <20230710133836.4367-1-mail@eworm.de>
 <20230710142916.18162-1-mail@eworm.de>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <20230710142916.18162-1-mail@eworm.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1689007974;7cd3bc52;
X-HE-SMSGID: 1qIu83-0003mt-VT

On 10.07.23 16:28, Christian Hesse wrote:
> This device suffer an irq storm, so add it in tpm_tis_dmi_table to
> force polling.
> 
> Link: https://community.frame.work/t/boot-and-shutdown-hangs-with-arch-linux-kernel-6-4-1-mainline-and-arch/33118
> Fixes: e644b2f498d2 ("tpm, tpm_tis: Enable interrupt test")
> Cc: stable@vger.kernel.org
> Reported-by: <roubro1991@gmail.com>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217631

Thx again for working on this. FWIW, a quote from a recent comment there
FYI:

```
 mapleleaf 2023-07-10 16:37:03 UTC

I have the same problem and I own a Framework 12th-gen, but for whatever
reason my DMI_PRODUCT_VERSION is A8 instead of A6...

$ sudo dmidecode -s baseboard-version
A8

[tag] [reply] [−]
Private
Comment 13 mapleleaf 2023-07-10 16:41:29 UTC

And also:

$ sudo dmidecode -s system-version
A8

```

> ---
>  drivers/char/tpm/tpm_tis.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/char/tpm/tpm_tis.c b/drivers/char/tpm/tpm_tis.c
> index 7db3593941ea..2979f8b9aaa0 100644
> --- a/drivers/char/tpm/tpm_tis.c
> +++ b/drivers/char/tpm/tpm_tis.c
> @@ -114,6 +114,14 @@ static int tpm_tis_disable_irq(const struct dmi_system_id *d)
>  }
>  
>  static const struct dmi_system_id tpm_tis_dmi_table[] = {
> +	{
> +		.callback = tpm_tis_disable_irq,
> +		.ident = "Framework Laptop Intel 12th gen",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Framework"),
> +			DMI_MATCH(DMI_PRODUCT_VERSION, "A4"),
> +		},
> +	},
>  	{
>  		.callback = tpm_tis_disable_irq,
>  		.ident = "ThinkPad T490s",
