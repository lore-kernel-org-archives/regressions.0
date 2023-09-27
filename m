Received: from abi149hd127.arn1.oracleemaildelivery.com (abi149hd127.arn1.oracleemaildelivery.com [129.149.84.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90F93C69C
	for <regressions@lists.linux.dev>; Wed, 27 Sep 2023 20:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=oci-arn1-20220924;
 d=augustwikerfors.se;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender;
 bh=kWHEaE4TCj1UBa4oGH5EPwk2RSc/PwXJfUkNV04nu6I=;
 b=RhXS84vf0w7Pw69zK6/BkeWyxdOFSCQSUp5nXqJJrt2F/hejIDw3ZNHFevrGwjN/2JTHiff7Thdy
   BWVoriuzf4eqc+CYv1Gk6nq8Yo82nIiJO9n+sJEv5AF0hwAHwiENrKiEzHeU0Z6JSaI9OWQWbGXe
   NcZ6Ez9SPlWUmpjEPutR7QTG/4v8bZXIG364vtOu2QXR/p/Lb1tGvNGvX/Wa0m7vbd1kDMDPhlwX
   tVUQH2rOiRjIdX3peo6jWJVMl9D4XO1ghescauMUkN+W2TNmdsnITzErbthlZx6TjR6ZaQzAQMnn
   SrGYy1mxxUo3try63WvI012JbGfCpJN+2EO5Vg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=prod-arn-20211201;
 d=arn1.rp.oracleemaildelivery.com;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender;
 bh=kWHEaE4TCj1UBa4oGH5EPwk2RSc/PwXJfUkNV04nu6I=;
 b=QDFPYcwGB+JfAxg30wPhmGfYIBQB3XpFT4dnRJgIFNIWEwAnlw4xgEORL4qaebBgruJQvXGv0dvz
   1XEzm5BytHAMHaBHMx7CQrxccZKJfWIoDTd/Ds9xUJDZSKwCJQIXr5qIO1zMUMY3DLG70Zojy9kX
   2DY/cYRVakfccJopC88oQ0Ybux3phjnI8EWdB+16gjyg9Dm4QWw0wKGsTgkVNbLD/MnfaCocwft0
   qVLTgj1kIBVnA1qTPjJHzhG7Y58jI+fCDVr+4T7CC9RSJX/DIuYWX4FKw9pN0RdN4TTnE2wbby0u
   zmwAxJLWsjXsWgZ8uw4wZLHNDqiW2/0CSpupBw==
Received: by omta-ad1-fd2-401-eu-stockholm-1.omtaad1.vcndparn.oraclevcn.com
 (Oracle Communications Messaging Server 8.1.0.1.20230808 64bit (built Aug  8
 2023))
 with ESMTPS id <0S1N00N4HV448JA0@omta-ad1-fd2-401-eu-stockholm-1.omtaad1.vcndparn.oraclevcn.com>
 for regressions@lists.linux.dev; Wed, 27 Sep 2023 20:19:16 +0000 (GMT)
Message-id: <e67aec21-eb9b-4133-b879-7b2b6d03f50e@augustwikerfors.se>
Date: Wed, 27 Sep 2023 22:19:12 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-version: 1.0
Subject: Re: [PATCH v2] ASoC: amd: yc: Fix non-functional mic on Lenovo 82YM
Content-language: en-US
To: Sven Frotscher <sven.frotscher@gmail.com>
Cc: broonie@kernel.org, alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, mario.limonciello@amd.com,
 regressions@lists.linux.dev
References: <O2TN1S.57QJOL6TXOBC1@gmail.com>
From: August Wikerfors <git@augustwikerfors.se>
In-reply-to: <O2TN1S.57QJOL6TXOBC1@gmail.com>
Content-type: text/plain; charset=UTF-8; format=flowed
Content-transfer-encoding: 8bit
Reporting-Meta:
 AAEINYZ3dhLONaY9tyI3lZesZ89O1+5jgsVyp4dMSkyYuppG/dP70jN8lViyntJq
 I5DRJNIssIA14bGdujZ0fmSb5GPSDteTcc3hL5kmC4bGtIQHJmYZTRWHIDpTOoBc
 rA8qKyWJBfLGAqml3Bk6Z3VoiKh4SIO9jlljvsIpXx4Uk4KkOWDAwZCX3yJElMpQ
 M58Nf/0GcUYJJhhGkmzx1lyfiItD/bAfSrLqHFuKyFUWIibaueoT3GanJFDFc0JR
 S6DU43q3FO7i9GBvXTC/iZ2qG1cVydr0xKTF+fl9UzXzEK0IiQQMZQOYvvJG7+P3
 yPePgZ4j7IRl/fr3Am9jaH/pG8xnEi2AbdLvN945al0QbNGeo5fdFrpIvEw628TX
 cJdg24tuYKb+KoE0B9rHwShAgSCdJ2K/zQ4NaYPg24M24DV/PVG5muQTkCTko2yq sDKx9EU=

Hi Sven,

On 2023-09-27 21:35, Sven Frotscher wrote:
> 
> Like the Lenovo 82TL, 82V2, 82QF and 82UG, the 82YM (Yoga 7 14ARP8)
> requires an entry in the quirk list to enable the internal microphone.
> The latter two received similar fixes in commit 1263cc0f414d.
> 
> Fixes: c008323fe361 ("ASoC: amd: yc: Fix a non-functional mic on Lenovo 
> 82SJ")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sven Frotscher <sven.frotscher@gmail.com>
> ---
> v1->v2 changes:
> * add Fixes and Cc tags to commit message
> * remove redundant LKML link from commit message
> * fix mangled diff
> 
> sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
> 1 file changed, 7 insertions(+)
> 
> diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
> index 3d8a51351e29..e3d2b9d01552 100644
> --- a/sound/soc/amd/yc/acp6x-mach.c
> +++ b/sound/soc/amd/yc/acp6x-mach.c
> @@ -241,6 +241,13 @@ static const struct dmi_system_id 
> yc_acp_quirk_table[] = {
>          DMI_MATCH(DMI_PRODUCT_NAME, "82V2"),
>      }
>      },
> +    {
> +    .driver_data = &acp6x_card,
> +    .matches = {
> +        DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
> +        DMI_MATCH(DMI_PRODUCT_NAME, "82YM"),
> +    }
> +    },
>      {
>      .driver_data = &acp6x_card,
>      .matches = {
This diff still doesn't look right, some of the lines are indented by 
one tab too little compared to the original code. Also, the e-mail is 
sent with format=flowed which git am complains about:

> warning: Patch sent with format=flowed; space at the end of lines might be lost.
> Applying: ASoC: amd: yc: Fix non-functional mic on Lenovo 82YM
> error: corrupt patch at line 15

It's better to send patches with git send-email to avoid these problems.

Regards,
August Wikerfors
