Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBCC28E9
	for <regressions@lists.linux.dev>; Tue, 10 May 2022 15:34:58 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1noRt0-0000Py-Tt; Tue, 10 May 2022 17:34:55 +0200
Message-ID: <6e44ba51-167b-0e0a-7fe6-267d1f7a26c4@leemhuis.info>
Date: Tue, 10 May 2022 17:34:54 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: 5.18 vmwgfx seems to break booting VirtualBox VMs #forregzbot
Content-Language: en-US
To: regressions@lists.linux.dev
References: <2bd4b06e-7577-d7d7-5f2e-264005b316a1@redhat.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <2bd4b06e-7577-d7d7-5f2e-264005b316a1@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1652196898;0d1d2eaa;
X-HE-SMSGID: 1noRt0-0000Py-Tt

On 11.04.22 10:52, Hans de Goede wrote:
> 
> Fedora has received a bug report here:
> 
> https://bugzilla.redhat.com/show_bug.cgi?id=2072556
> 
> That Fedora rawhide VMs no longer boot under the VirtualBox hypervisor
> after the VM has been updated to a 5.18-rc# kernel.
> 
> Switching the emulated GPU from vmwaregfx to VirtualBoxSVGA fixes
> this, so this seems to be a vmwgfx driver regression.
> 
> Note I've not investigated/reproduced this myself due to -ENOTIME.

TWIMC: this mail is primarily send for documentation purposes and for
regzbot, my Linux kernel regression tracking bot. These mails usually
contain '#forregzbot' in the subject, to make them easy to spot and filter.

FWIW, this issue wasn't tracked yet, so let's add it:

#regzbot ^introduced dabdcdc9822a
#regzbot title drm: vmwgfx: VirtualBox VMs stopped booting
#regzbot ignore-activity
#regzbot monitor:
https://lore.kernel.org/all/20220509110425.165537-1-hdegoede@redhat.com/
#regzbot monitor:
https://lore.kernel.org/all/20220302152426.885214-7-zack@kde.org/

Ciao, Thorsten


