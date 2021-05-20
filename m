Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8946972
	for <regressions@lists.linux.dev>; Thu, 20 May 2021 10:43:21 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id g24so8894156pji.4
        for <regressions@lists.linux.dev>; Thu, 20 May 2021 03:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=IW04GkrcNnLMAgZe3Aeh8iweN6/3sTprJybql0T99eU=;
        b=oPEiuLTy7B21if9MS/Aqe/xhEXvdul2VHQZ2dLfRfAWSFIM/bH0erRY3bvkraCo5Qe
         xFwCGhZIorGqeMga+TcD4N0vDd8s19Mq/WS9TSnb/SC6E9VbtGx7T2DO0Q2uHtp+BlBw
         Mdgn1DuPUHcdJ93Fp3fCYD7eAGBAVr8OpGHJZqwUl29g40s8oL/mj8NLk97bcewn8DMQ
         PEgycLPlx+Yif+9LzRpMunv9EyLAtc491VkCdFn7xDa/4qM0uCbVY8f8Bd+vfh2RFSxa
         HrOg5r5+s/w8jTzF56/Hd6IlWei/Wga2VsiskbrARruT5VsCPP0l1OEgn/PMan0ER5Le
         IWEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IW04GkrcNnLMAgZe3Aeh8iweN6/3sTprJybql0T99eU=;
        b=RGJzpx+5gizg4Nn9QXbU4/O1WJuz3vV6ChXBftADEkwHpvK3tjuyueH6rMSG06VoDv
         JLlgO6eR2aXZ4xaj3JWdP6rMAwqITY9zyDIH95NH27BEMsY2dg60xVMlI+S8kFkLATTZ
         /1ausdXGGeHrJC88OmA/qXX8vmjkyt2g9JIKyD/xvBxsmjyLJWlYjXGZ6EkOd7rxlWo+
         D/Zgo4YzJvkh/7ShUU9tM59vngJJfk67YoMY7MhBQ/+72p6NV3r6FtM1AN+9PrxPZFTq
         QOh3mahRn02dWhUKcTTc7Z1+RotQBHjB+N7yoQGfKZDDlkdP/R0eo8fJFPRlscMzdnQf
         V4uA==
X-Gm-Message-State: AOAM5336jkP0CcX2u1kPUZWDrRUWqvspC+5YSciHFGW0La2wFQRNplsb
	/LI4KfnzR4KTd8Cr6bx0coQH
X-Google-Smtp-Source: ABdhPJz64/pJD46QBHy45o4IwFLczk2gwoYOT2rXejR2w6Qbb29ZLdjhx5buftHryFa22aCeRIfe3Q==
X-Received: by 2002:a17:902:cec3:b029:f6:276b:a2b1 with SMTP id d3-20020a170902cec3b02900f6276ba2b1mr1650782plg.71.1621507400944;
        Thu, 20 May 2021 03:43:20 -0700 (PDT)
Received: from thinkpad ([2409:4072:6d8e:dcde:240f:c67:6200:7740])
        by smtp.gmail.com with ESMTPSA id t133sm1928425pgb.0.2021.05.20.03.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 03:43:20 -0700 (PDT)
Date: Thu, 20 May 2021 16:13:13 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Kalle Valo <kvalo@codeaurora.org>,
	Bhaumik Bhatt <bbhatt@codeaurora.org>,
	Loic Poulain <loic.poulain@linaro.org>, ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org, regressions@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [regressions] ath11k: v5.12.3 mhi regression
Message-ID: <20210520104313.GA128703@thinkpad>
References: <87v97dhh2u.fsf@codeaurora.org>
 <YKYzwBJNTy4Czd1A@kroah.com>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YKYzwBJNTy4Czd1A@kroah.com>

On Thu, May 20, 2021 at 12:02:40PM +0200, Greg KH wrote:
> On Thu, May 20, 2021 at 12:47:53PM +0300, Kalle Valo wrote:
> > Hi,
> > 
> > I got several reports that this mhi commit broke ath11k in v5.12.3:
> > 
> > commit 29b9829718c5e9bd68fc1c652f5e0ba9b9a64fed
> > Author: Bhaumik Bhatt <bbhatt@codeaurora.org>
> > Date:   Wed Feb 24 15:23:04 2021 -0800
> > 
> >     bus: mhi: core: Process execution environment changes serially
> >     
> >     [ Upstream commit ef2126c4e2ea2b92f543fae00a2a0332e4573c48 ]
> > 
> > Here are the reports:
> > 
> > https://bugzilla.kernel.org/show_bug.cgi?id=213055
> > 
> > https://bugzilla.kernel.org/show_bug.cgi?id=212187
> > 
> > https://bugs.archlinux.org/task/70849?project=1&string=linux
> > 
> > Interestingly v5.13-rc1 seems to work fine, at least for me, though I
> > have not tested v5.12.3 myself. Can someone revert this commit in the
> > stable release so that people get their wifi working again, please?
> 
> How does the mhi bus code relate to a ath11k driver?  What bus is that
> on?
> 

MHI is the transport used by the ath11k driver to work with the WLAN devices
over PCIe.

Regarding the bug, I'd suggest to wait for Bhaumik (the author of 29b9829718c5)
to comment on the possible commit which needs backporting from mainline.

Thanks,
Mani

> This seems odd...
> 
> greg k-h
