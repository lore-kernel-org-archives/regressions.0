Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301B11852
	for <regressions@lists.linux.dev>; Wed, 18 May 2022 05:52:45 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1nrCbt-0002Y0-7i; Wed, 18 May 2022 07:52:37 +0200
Message-ID: <4c8afdd6-3573-619d-d46c-e13a4fdd9ac7@leemhuis.info>
Date: Wed, 18 May 2022 07:52:36 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [REGRESSION] Laptop with Ryzen 4600H fails to resume video since
 5.17.4 (works 5.17.3)
Content-Language: en-US
To: casteyde.christian@free.fr, Kai-Heng Feng <kai.heng.feng@canonical.com>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev,
 alexander deucher <alexander.deucher@amd.com>, gregkh@linuxfoundation.org,
 Mario Limonciello <mario.limonciello@amd.com>
References: <941867856.547807110.1652809066335.JavaMail.root@zimbra40-e7.priv.proxad.net>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <941867856.547807110.1652809066335.JavaMail.root@zimbra40-e7.priv.proxad.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1652853165;59faade2;
X-HE-SMSGID: 1nrCbt-0002Y0-7i

On 17.05.22 19:37, casteyde.christian@free.fr wrote:

> I've tryied to revert the offending commit on 5.18-rc7 (887f75cfd0da
> ("drm/amdgpu: Ensure HDA function is suspended before ASIC reset"), and
> the problem disappears so it's really this commit that breaks.

In that case I'll update the regzbot status to make sure it's visible as
regression introduced in the 5.18 cycle:

#regzbot introduced: 887f75cfd0da

BTW: obviously would be nice to get this fixed before 5.18 is released
(which might already happen on Sunday), especially as the culprit
apparently was already backported to stable, but I guess that won't be
easy...

Which made me wondering: is reverting the culprit temporarily in
mainline (and reapplying it later with a fix) a option here?

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.
