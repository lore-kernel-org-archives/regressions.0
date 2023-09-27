Received: from abi149hd126.arn1.oracleemaildelivery.com (abi149hd126.arn1.oracleemaildelivery.com [129.149.84.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1997227EFC
	for <regressions@lists.linux.dev>; Wed, 27 Sep 2023 17:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=oci-arn1-20220924;
 d=augustwikerfors.se;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender;
 bh=2/l64ESvX3L+vIHRLzcU/B0t8GMPI3Lpqyo4lNmvNeU=;
 b=BZ6DMyltQg9yBoL1mS43hzA2MCs+q9DFw81K7XlQHjU49XM4rEDqk0nyfs7843qfR1mbCF4+MOvw
   bhuhd1j8NaUi0IShlAjYSLHJMW4Kc5yIgaxU60a0WFxsw32rNZN24rBw0cyV4zbmM2rv74gWKXV3
   psg9Dz8KM/nRvTI013x3wrCKuSw+OpWzxeMJoE5bodFpyodDIsJZ5+6sLkUh06F4EcwpUdhM38/C
   Dl+tDTnbRuKYuquaOK+03d9WIII54ouMkspeo7ifm4Zy0D0jeSF0n3vD0buj2/AXNfl5l5Qwv2IX
   mSh5yGGfjDmBAL+t/jouxvHBUpW0/P88xWspmg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=prod-arn-20211201;
 d=arn1.rp.oracleemaildelivery.com;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender;
 bh=2/l64ESvX3L+vIHRLzcU/B0t8GMPI3Lpqyo4lNmvNeU=;
 b=BH10ErWPgQ3N4JyLJnenvlfMwWtjlPJFY8F0LeqXHJvyzOTV4PKksa1LDctAPM2gwFIUAy/pbZzg
   U/EFADGUh22sF88aUDsdSPk6J07eMfQcokVGd4KllumpIm6BGmkHloGommo11csFtKvxCp3AQ3Li
   iK1nJNbdHRTuRse8Sef7c+wUGH04rYzoq7vW2FSySMRmTSupCW857Rq2xq4uAeeUiOkTEKEh3V+i
   9WvpIkD/fMWwE1mM/xPVUlB33qw2rcx8kc4swJZwKtexaoNV2X/qMdHJz8ruTDkVSZf3bDeyU43D
   0rZlczrel4JeQmy33pTqa/GJS251mqHkz7fXHA==
Received: by omta-ad1-fd3-401-eu-stockholm-1.omtaad1.vcndparn.oraclevcn.com
 (Oracle Communications Messaging Server 8.1.0.1.20230808 64bit (built Aug  8
 2023))
 with ESMTPS id <0S1N0049ZNTNQ700@omta-ad1-fd3-401-eu-stockholm-1.omtaad1.vcndparn.oraclevcn.com>
 for regressions@lists.linux.dev; Wed, 27 Sep 2023 17:41:47 +0000 (GMT)
Message-id: <e8479eff-a5cb-41b0-8bf6-bcc20ccbecfb@augustwikerfors.se>
Date: Wed, 27 Sep 2023 19:41:43 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-version: 1.0
From: August Wikerfors <git@augustwikerfors.se>
Subject: Re: [PATCH] ASoC: amd: yc: Fix non-functional mic on Lenovo 82YM
To: Sven Frotscher <sven.frotscher@gmail.com>
Cc: broonie@kernel.org, alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, mario.limonciello@amd.com,
 regressions@lists.linux.dev
References: <R5KN1S.18M6QDS4T9PY1@gmail.com>
Content-language: en-US
In-reply-to: <R5KN1S.18M6QDS4T9PY1@gmail.com>
Content-type: text/plain; charset=UTF-8; format=flowed
Content-transfer-encoding: 7bit
Reporting-Meta:
 AAEINYZ3dhLONaY9tyI3lZesZ89O1+5jgsVyp4dMSkyYuppG/dP70jN8lViyntJq
 I5DRJNIssIA14bGdujazc2Sb5GPSDteTcc2I/+yhrsM++HIW1/SqYABZUlsTfv4X
 ccnTVP5KV0HBhD0ijCoFR5DVPFc8R1AqbSTqFsRzSsIass39y7GUqWzQxdNj5nLW
 Vjixhau7FRnk2qwFpxs9riSQNsBi2N8cZM8S6dMGKusqXRYuxWg6yYuKKeURyfMv
 E0zk36QOqtQat3JIqk4XGfuZ4pPQMOAN2XBHJdu4VTrlaT06A2at0MHnxFa06EiP
 QcKT4H/U76BjiwUSH4ubacqk/CgToebbweAZqyEBm3jGnEoTcEV1ZMc9gdEy1se0
 ERhx8oZFEGw+iXu25qeI5e10xuALo4I7HQOt1azLTDY0NUWYhC8/6hL1kqW/7s6R cFOZvg==

Hi,

On 2023-09-27 18:22, Sven Frotscher wrote:
> 
> Like the Lenovo 82TL, 82V2, 82QF and 82UG, the 82YM (Yoga 7 14ARP8)
> requires an entry in the quirk list to enable the internal microphone.
> The latter two received similar fixes in commit 1263cc0f, see
> https://lore.kernel.org/r/20230911213409.6106-1-git@augustwikerfors.se.
> 
> Signed-off-by: Sven Frotscher <sven.frotscher@gmail.com>
Since this fixes a regression caused by commit c008323fe361 which has
been backported to stable, please add "Fixes:" and "Cc:" tags above the
"Signed-off-by:" tag to ensure the fix also gets backported in a timely
manner [1]:

Fixes: c008323fe361 ("ASoC: amd: yc: Fix a non-functional mic on Lenovo 82SJ")
Cc: stable@vger.kernel.org

> ---
> sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
> 1 file changed, 7 insertions(+)
> 
> diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
> index 3d8a51351e29..e3d2b9d01552 100644
> --- a/sound/soc/amd/yc/acp6x-mach.c
> +++ b/sound/soc/amd/yc/acp6x-mach.c
> @@ -241,6 +241,13 @@ static const struct dmi_system_id 
> yc_acp_quirk_table[] = {
>  >..>...>...DMI_MATCH(DMI_PRODUCT_NAME, "82V2"),
>  >..>...}
>  >..},
> +>..{
> +>..>....driver_data = &acp6x_card,
> +>..>....matches = {
> +>..>...>...DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
> +>..>...>...DMI_MATCH(DMI_PRODUCT_NAME, "82YM"),
> +>..>...}
> +>..},
>  >..{
>  >..>....driver_data = &acp6x_card,
>  >..>....matches = {
Your e-mail client seems to have mangled the leading whitespace here,
which will prevent the patch from applying cleanly. It is strongly
recommended [2] to use git send-email for sending patches, see [3] for a
tutorial on how to set up and use it. For other e-mail clients, see [4].

[1] https://www.kernel.org/doc/html/latest/process/handling-regressions.html#what-s-important-when-fixing-regressions
[2] https://www.kernel.org/doc/html/latest/process/submitting-patches.html#no-mime-no-links-no-compression-no-attachments-just-plain-text
[3] https://git-send-email.io/
[4] https://www.kernel.org/doc/html/latest/process/email-clients.html

Regards,
August Wikerfors
