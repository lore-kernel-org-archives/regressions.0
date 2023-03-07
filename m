Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D26B33C9
	for <regressions@lists.linux.dev>; Tue,  7 Mar 2023 10:19:40 +0000 (UTC)
Received: from [141.14.220.45] (g45.guest.molgen.mpg.de [141.14.220.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id A1B6C60027689;
	Tue,  7 Mar 2023 11:12:59 +0100 (CET)
Message-ID: <3ef31c0b-ce40-20d0-7740-5dc0cca278ca@molgen.mpg.de>
Date: Tue, 7 Mar 2023 11:12:59 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [Intel-wired-lan] [REGRESSION] Deadlock since commit 6faee3d4ee8b
 ("igb: Add lock to avoid data race")
Content-Language: en-US
To: Lin Ma <linma@zju.edu.cn>
References: <ZAcJvkEPqWeJHO2r@calimero.vinschen.de>
Cc: intel-wired-lan@lists.osuosl.org, regressions@lists.linux.dev
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <ZAcJvkEPqWeJHO2r@calimero.vinschen.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

[Adding regressions@lists.linux.dev]

#regzbot ^introduced: 6faee3d4ee8b

Am 07.03.23 um 10:54 schrieb Corinna Vinschen:
> Hi,
> 
> 
> After patch 6faee3d4ee8b ("igb: Add lock to avoid data race"), we see
> a deadlock scenario when trying to unload the igb module.
> 
> The reproducer is pretty simple:
> 
>    # echo 2 > /sys/class/net/ens5f2/device/sriov_numvfs
>    # modprobe -r igb
> 
> The hang is quite thorough, I assume it's suffering a deadlock between
> the rtnl_lock and the spinlock introduced by 6faee3d4ee8b.
> 
> Any chance you could have a look?
> 
> 
> Thanks,
> Corinna
