Received: from abi149hd127.arn1.oracleemaildelivery.com (abi149hd127.arn1.oracleemaildelivery.com [129.149.84.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B676914263
	for <regressions@lists.linux.dev>; Wed, 27 Sep 2023 19:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=oci-arn1-20220924;
 d=augustwikerfors.se;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender;
 bh=zEC1Zp0mTXHbkZhMbfbhPRw1ReAe5+CIJ539h/vevNs=;
 b=D2S+3Qt5OlnXTR+Dx/2h+Xc7q7p7EvsuJZwBDVmjvOTKWMT70IYxKB+0w/XJwRih9fz7T0L8X9qh
   c9lBX6gCAjhqDT2bBNEYEOnV9Gl+Iy8N8T90VM7X7KnZ95fcLHKzyNZFl4DK/RAg9P9BUmvU7gIq
   xtnFc/OyOtQ6QtiWyxVrSHarOps0BaKcesQKZrU9ev8Y38QOVFjnJ0QaVdndDMgYwWum6QQ5Y4pt
   jtY/e+L7/Yyx/M5Pm/5LOLNMxM+nYWh5SmelAPIYIxvSAF97QYmg8qzUp0R3g85K6XDOGuLJAy4/
   Sr3Te0wWiIJ2DPwW4KRqeL7lF4VFdSEilj7/0Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=prod-arn-20211201;
 d=arn1.rp.oracleemaildelivery.com;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender;
 bh=zEC1Zp0mTXHbkZhMbfbhPRw1ReAe5+CIJ539h/vevNs=;
 b=ANVwMx8OUZE8LijI1gYRQ0MmwMfvjHR2rUeSIUpnLiYupbym2BMTEX1l99EO9IIKj0xfcNOB8lVr
   FOKinuNWCP9+nkXZs30J9OOMwZ4gqG8ljP1wy2knhlL1QhSJILuwwu7Wa9JjDViCc0wOa+7J3EbC
   XcqjIk0Tn98ksW9/SdE9TIVbDm2K0RWlmWD4sqW8G9p4EOA+quM7DP6dORZBwRaLj8XZyytHDsw8
   E7oGV8yNv0ryVEHGEOZAtJ6SsFwf/x9w9em3gIqk3QSCDdFjoseX/AXuM2ErdtNL77LFZV4WKeDs
   OfK/ZnConUYIkGiajqM5c/ubewvRdzBHRlhTHg==
Received: by omta-ad1-fd2-401-eu-stockholm-1.omtaad1.vcndparn.oraclevcn.com
 (Oracle Communications Messaging Server 8.1.0.1.20230808 64bit (built Aug  8
 2023))
 with ESMTPS id <0S1N00NVRRT58J70@omta-ad1-fd2-401-eu-stockholm-1.omtaad1.vcndparn.oraclevcn.com>
 for regressions@lists.linux.dev; Wed, 27 Sep 2023 19:07:53 +0000 (GMT)
Message-id: <288a2a10-137d-49b5-8d44-feb18f5696d2@augustwikerfors.se>
Date: Wed, 27 Sep 2023 21:07:49 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-version: 1.0
Subject: Re: [PATCH] ASoC: amd: yc: Fix non-functional mic on Lenovo 82YM
Content-language: en-US
To: Sven Frotscher <sven.frotscher@gmail.com>
Cc: broonie@kernel.org, alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, mario.limonciello@amd.com,
 regressions@lists.linux.dev
References: <R5KN1S.18M6QDS4T9PY1@gmail.com>
 <e8479eff-a5cb-41b0-8bf6-bcc20ccbecfb@augustwikerfors.se>
 <2ZQN1S.P7M0RX306S1D3@gmail.com>
From: August Wikerfors <git@augustwikerfors.se>
In-reply-to: <2ZQN1S.P7M0RX306S1D3@gmail.com>
Content-type: text/plain; charset=UTF-8; format=flowed
Content-transfer-encoding: 7bit
Reporting-Meta:
 AAEINYZ3dhLONaY9tyI3lZesZ89O1+5jgsVyp4dMSkyYuppG/dP70jN8lViyntJq
 I5DRJNIssIA14bGdujZ0eWSb5GPSDteTcc2i7zRIUji2Zo2jcZANSsizAr+IR/UU
 cx8n4SwIHrTEkw6SUByaMc4RaiIfhhplHcsx/E0ORF7FNQF+RZM068/0YXpbh3mg
 LMYxmfu7tAXl4LDUmypDlDDG6J+X5CyXXME6SLG4xtpn+pD3WksGKrfcV7ymvHqp
 vZ6hI7O7ppONB2Wtn2+jJagmqVF0Fa2wHfLFOemMPIFWnhTBNvZWecAY4uLt2Ze/
 o38/ehUpjn0I/V2RCs+e7vgJV7F3HjjS8n7ImBzI0U4Umdo1t3CnShuKak2adzZC
 gU4mCzd3AQSeeG45w8KBG8Vk2hRV4+pz0rofieUfpAQoPngUUWoel3LcrA3ZfCRO OM4Srg==

On 2023-09-27 20:49, Sven Frotscher wrote:
> Hello,
> 
>  > > Signed-off-by: Sven Frotscher <sven.frotscher@gmail.com>
>  > Since this fixes a regression caused by commit c008323fe361 which has
>  > been backported to stable, please add "Fixes:" and "Cc:" tags above the
>  > "Signed-off-by:" tag to ensure the fix also gets backported in a timely
>  > manner [1]:
>  >
>  > Fixes: c008323fe361 ("ASoC: amd: yc: Fix a non-functional mic on 
> Lenovo 82SJ")
>  > Cc: stable@vger.kernel.org
> I will.
> 
>  > > +>..>...>...DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
>  > > +>..>...>...DMI_MATCH(DMI_PRODUCT_NAME, "82YM"),
>  > Your e-mail client seems to have mangled the leading whitespace here,
>  > which will prevent the patch from applying cleanly.
> My e-mail client isn't the problem here, but my Vim syntax highlighting
> for tabs... I should've noticed that when copy-pasting from test e-mail
> to patch e-mail via Vim.
> 
> Should I reply to this thread with a [PATCH v2] message or create a new
> thread?
AFAIK either way is fine, separate thread seems more common though.
